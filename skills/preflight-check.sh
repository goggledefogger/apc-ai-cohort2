#!/usr/bin/env bash
# APC AI Builder's Course — Pre-Flight Check Script
# Deterministic checks for all course prerequisites.
# Outputs structured results that the Claude Code skill interprets.
#
# Usage: bash preflight-check.sh
# Exit code: 0 if all checks pass, 1 if any fail

set -euo pipefail

# --- Colors (if terminal supports them) ---
if [ -t 1 ]; then
  GREEN='\033[0;32m'
  RED='\033[0;31m'
  YELLOW='\033[0;33m'
  BLUE='\033[0;34m'
  BOLD='\033[1m'
  NC='\033[0m'
else
  GREEN='' RED='' YELLOW='' BLUE='' BOLD='' NC=''
fi

# --- Counters ---
PASS_COUNT=0
FAIL_COUNT=0
SKIP_COUNT=0
TOTAL_CHECKS=10

# --- Results storage ---
declare -a RESULTS=()
declare -a FAILURES=()

# --- Helper functions ---
result_pass() {
  local name="$1" detail="$2"
  RESULTS+=("PASS|${name}|${detail}")
  PASS_COUNT=$((PASS_COUNT + 1))
  echo -e "  ${GREEN}PASS${NC}  ${name}: ${detail}"
}

result_fail() {
  local name="$1" detail="$2"
  RESULTS+=("FAIL|${name}|${detail}")
  FAILURES+=("${name}|${detail}")
  FAIL_COUNT=$((FAIL_COUNT + 1))
  echo -e "  ${RED}FAIL${NC}  ${name}: ${detail}"
}

result_skip() {
  local name="$1" detail="$2"
  RESULTS+=("SKIP|${name}|${detail}")
  SKIP_COUNT=$((SKIP_COUNT + 1))
  echo -e "  ${YELLOW}SKIP${NC}  ${name}: ${detail}"
}

# --- Detect OS ---
detect_os() {
  local uname_out
  uname_out="$(uname -s 2>/dev/null || echo 'Unknown')"
  case "$uname_out" in
    Darwin*)  echo "macOS" ;;
    Linux*)   echo "Linux" ;;
    MINGW*|MSYS*|CYGWIN*) echo "Windows" ;;
    *)        echo "Unknown" ;;
  esac
}

# ============================================================
# MAIN
# ============================================================

OS="$(detect_os)"

echo ""
echo -e "${BOLD}=== APC AI Builder's Course — Pre-Flight Check ===${NC}"
echo -e "  OS detected: ${BLUE}${OS}${NC}"
echo ""

# --- Check 1: Node.js ---
if command -v node &>/dev/null; then
  NODE_VERSION="$(node -v 2>/dev/null)"
  NODE_MAJOR="${NODE_VERSION#v}"
  NODE_MAJOR="${NODE_MAJOR%%.*}"
  if [ "$NODE_MAJOR" -ge 18 ] 2>/dev/null; then
    result_pass "Node.js" "${NODE_VERSION}"
  else
    result_fail "Node.js" "Version ${NODE_VERSION} is too old (need v18+). Download LTS from https://nodejs.org"
  fi
else
  result_fail "Node.js" "Not installed. Download LTS from https://nodejs.org (use the website installer, not brew/nvm)"
fi

# --- Check 2: Git ---
if command -v git &>/dev/null; then
  GIT_VERSION="$(git --version 2>/dev/null)"
  result_pass "Git" "${GIT_VERSION}"
else
  if [ "$OS" = "macOS" ]; then
    result_fail "Git" "Not installed. Run: xcode-select --install"
  elif [ "$OS" = "Linux" ]; then
    result_fail "Git" "Not installed. Run: sudo apt install git (or your distro's package manager)"
  else
    result_fail "Git" "Not installed. Download from https://git-scm.com/download/win"
  fi
fi

# --- Check 3: GitHub CLI ---
if command -v gh &>/dev/null; then
  GH_VERSION="$(gh --version 2>/dev/null | head -1)"
  result_pass "GitHub CLI" "${GH_VERSION}"
else
  if [ "$OS" = "macOS" ]; then
    result_fail "GitHub CLI" "Not installed. Run: brew install gh (or download from https://cli.github.com)"
  elif [ "$OS" = "Linux" ]; then
    result_fail "GitHub CLI" "Not installed. See https://github.com/cli/cli/blob/trunk/docs/install_linux.md"
  else
    result_fail "GitHub CLI" "Not installed. Download from https://cli.github.com"
  fi
fi

# --- Check 4: GitHub Auth ---
if command -v gh &>/dev/null; then
  if gh auth status &>/dev/null; then
    GH_USER="$(gh auth status 2>&1 | grep -o 'Logged in to github.com as [^ ]*' | head -1 || echo 'authenticated')"
    result_pass "GitHub Auth" "${GH_USER}"
  else
    result_fail "GitHub Auth" "Not logged in. Run: gh auth login (select GitHub.com > HTTPS > Login with web browser)"
  fi
else
  result_fail "GitHub Auth" "Cannot check — GitHub CLI not installed (fix that first)"
fi

# --- Check 5: Claude Code ---
if command -v claude &>/dev/null; then
  CLAUDE_VERSION="$(claude --version 2>/dev/null || echo 'installed')"
  result_pass "Claude Code" "${CLAUDE_VERSION}"
else
  result_fail "Claude Code" "Not installed. Run: npm install -g @anthropic-ai/claude-code && claude install"
fi

# --- Check 6: SuperWhisper ---
SUPERWHISPER_FOUND=false
if [ "$OS" = "macOS" ]; then
  if [ -d "/Applications/SuperWhisper.app" ] || [ -d "$HOME/Applications/SuperWhisper.app" ]; then
    SUPERWHISPER_FOUND=true
  fi
  # Also check with mdfind (Spotlight) as fallback
  if [ "$SUPERWHISPER_FOUND" = false ] && command -v mdfind &>/dev/null; then
    if mdfind "kMDItemFSName == 'SuperWhisper.app'" 2>/dev/null | grep -q SuperWhisper; then
      SUPERWHISPER_FOUND=true
    fi
  fi
elif [ "$OS" = "Windows" ]; then
  if command -v superwhisper &>/dev/null 2>&1; then
    SUPERWHISPER_FOUND=true
  fi
fi

if [ "$SUPERWHISPER_FOUND" = true ]; then
  result_pass "SuperWhisper" "App found"
elif [ "$OS" = "Linux" ]; then
  result_skip "SuperWhisper" "Not available on Linux. Consider alternatives like whisper.cpp or nerd-dictation"
else
  result_fail "SuperWhisper" "Not found. Download from https://superwhisper.com (also download the local Whisper model ~2GB)"
fi

# --- Check 7: Cursor ---
CURSOR_FOUND=false
if [ "$OS" = "macOS" ]; then
  if [ -d "/Applications/Cursor.app" ] || [ -d "$HOME/Applications/Cursor.app" ]; then
    CURSOR_FOUND=true
  fi
  if [ "$CURSOR_FOUND" = false ] && command -v mdfind &>/dev/null; then
    if mdfind "kMDItemFSName == 'Cursor.app'" 2>/dev/null | grep -q Cursor; then
      CURSOR_FOUND=true
    fi
  fi
elif [ "$OS" = "Linux" ]; then
  if command -v cursor &>/dev/null 2>&1; then
    CURSOR_FOUND=true
  elif [ -f "$HOME/Applications/cursor.AppImage" ] || [ -f "/opt/cursor/cursor" ]; then
    CURSOR_FOUND=true
  fi
elif [ "$OS" = "Windows" ]; then
  if command -v cursor &>/dev/null 2>&1; then
    CURSOR_FOUND=true
  fi
fi

if [ "$CURSOR_FOUND" = true ]; then
  result_pass "Cursor" "App found"
else
  result_fail "Cursor" "Not found. Download from https://cursor.com/download"
fi

# --- Check 8: Cursor Pro Plus subscription (cannot verify programmatically) ---
result_skip "Cursor Pro Plus" "Cannot verify automatically. Confirm you have the Pro Plus plan (\$60/mo) at Cursor Settings > Account"

# --- Check 9: Git Config (user.name and user.email) ---
GIT_NAME="$(git config --global user.name 2>/dev/null || echo '')"
GIT_EMAIL="$(git config --global user.email 2>/dev/null || echo '')"

if [ -n "$GIT_NAME" ] && [ -n "$GIT_EMAIL" ]; then
  result_pass "Git Config" "user.name='${GIT_NAME}', user.email='${GIT_EMAIL}'"
else
  MISSING=""
  [ -z "$GIT_NAME" ] && MISSING="user.name"
  [ -z "$GIT_EMAIL" ] && MISSING="${MISSING:+$MISSING and }user.email"
  result_fail "Git Config" "Missing ${MISSING}. Run: git config --global user.name \"Your Name\" && git config --global user.email \"your@email.com\""
fi

# --- Check 10: Claude Pro subscription (cannot verify programmatically) ---
result_skip "Claude Pro" "Cannot verify automatically. Confirm you have Claude Pro (\$20/mo) at https://claude.ai > Settings"

# ============================================================
# SUMMARY
# ============================================================
echo ""
echo -e "${BOLD}=== Summary ===${NC}"
echo -e "  ${GREEN}PASS: ${PASS_COUNT}${NC}  ${RED}FAIL: ${FAIL_COUNT}${NC}  ${YELLOW}SKIP: ${SKIP_COUNT}${NC}  (${TOTAL_CHECKS} total)"
echo ""

if [ "$FAIL_COUNT" -eq 0 ]; then
  echo -e "${GREEN}${BOLD}All automated checks passed! Confirm the SKIP items and you're ready for Session 1.${NC}"
  echo ""
  exit 0
else
  echo -e "${RED}${BOLD}${FAIL_COUNT} check(s) need attention:${NC}"
  echo ""
  PRIORITY=1
  for failure in "${FAILURES[@]}"; do
    fname="${failure%%|*}"
    fdetail="${failure#*|}"
    echo -e "  ${PRIORITY}. ${BOLD}${fname}${NC}: ${fdetail}"
    PRIORITY=$((PRIORITY + 1))
  done
  echo ""
  echo "Fix these items, then run this check again."
  echo ""
  exit 1
fi
