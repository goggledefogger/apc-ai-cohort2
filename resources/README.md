# Cohort 2 — Student Resources

Everything you need before, during, and after the course — in one place.

---

## What's What — Tool Glossary

### Where You Build
| Tool | What It Is |
|------|-----------|
| **Cursor** | AI-powered code editor. You write prompts, it writes code. Your home base for the entire course. Has Chat (`Cmd+L`) for questions and Composer (`Cmd+I`) for multi-file code generation. |
| **Claude Code** | AI that runs in your terminal. More autonomous than Cursor — you give it a task and it works through it step by step. Supports Skills (reusable instructions) and Agent Teams (multiple AI agents collaborating). Introduced fully in Session 5. |

### Your AI Assistants
| Tool | What It Is |
|------|-----------|
| **Claude** | Anthropic's AI assistant at [claude.ai](https://claude.ai). Use it for brainstorming, code review, and what we call the "consultant handoff" — paste code in, get advice back. Also powers Claude Code under the hood. |
| **Gemini** | Google's AI assistant at [gemini.google.com](https://gemini.google.com). Good for second opinions, brainstorming, and Google AI Studio prototyping. Optional — Claude is our primary AI. |

### Where Your Code Lives
| Tool | What It Is |
|------|-----------|
| **Git** | Version control — saves snapshots of your code so you can always go back. Runs locally on your machine. |
| **GitHub** | Cloud storage for your Git repositories. Your code is backed up, shareable, and part of your portfolio. |

### Your Backend (Server-Side)
| Tool | What It Is |
|------|-----------|
| **Supabase** | Your database and authentication layer. Where your app's data actually lives — so it persists across sessions, devices, and users. Built on PostgreSQL. Introduced in Session 3. |
| **Vercel** | Deployment platform — puts your app on the internet with a real URL anyone can visit. Introduced in Session 10. |

### How Tools Connect to Each Other
| Tool | What It Is |
|------|-----------|
| **MCP** | Model Context Protocol — a standard for connecting AI tools to external services. Example: Supabase MCP lets Cursor read and write your database directly. Introduced in Session 3. |
| **GitHub CLI (`gh`)** | Command-line tool for GitHub — handles authentication and repo management. Simpler than MCP for Git operations. |
| **Skills** | Packaged instructions for Claude Code. Like a recipe card — tell Claude Code exactly how to do a specific task, reusable across projects. |
| **npm packages** | Code libraries your app imports at runtime. Example: `@supabase/supabase-js` lets your app talk to Supabase. |

### Voice & Research
| Tool | What It Is |
|------|-----------|
| **Handy** | Voice dictation — hold a shortcut, talk, release, and your words appear as text. Free, open-source, runs locally so your audio stays private. |
| **NotebookLM** | Google's research tool — upload documents and ask questions about them. Good for exploring a topic deeply. |
| **Google AI Studio** | Quick visual prototyping with Google's AI. Good for initial design ideas before building in Cursor. |

### Infrastructure (You Won't Touch Directly)
| Tool | What It Is |
|------|-----------|
| **Node.js** | The engine that runs your app locally during development. You install it once and forget about it. |
| **npm** | Node's package manager — downloads and manages the libraries your app needs. |

---

## Before Session 1 (Pre-Flight)

| What | Link | Why |
|------|------|-----|
| **Setup Guide** | [Pre-Flight Setup Guide](../docs/pre-flight-setup-guide.md) | Step-by-step setup — accounts, Cursor, dev tools, Handy |
| **Setup Skill** | Run `/course-preflight` in Claude Code | Checks what's installed, installs what's missing, verifies everything |
| **Handy Help** | Run `/handy-setup` in Claude Code | Interactive help with Handy setup and troubleshooting |

## What You'll Set Up

### Step 1: Accounts + Apps (Do These Manually)
| What | Link | Cost |
|------|------|------|
| **Password manager** | [1Password](https://1password.com) or [Bitwarden](https://bitwarden.com) | Free / paid tiers |
| **GitHub account** | [github.com](https://github.com) | Free |
| **Claude Pro account** | [claude.ai](https://claude.ai) | $20/mo |
| **Cursor account + app** | [cursor.com](https://cursor.com) | $60/mo (Pro Plus) |
| **Handy** | [handy.computer](https://handy.computer) | Free & open source |

### Step 2: Dev Tools (Cursor Installs These For You)
Once Cursor is open, paste one prompt into Cursor Chat and it handles the rest:

| Tool | What It Does |
|------|-------------|
| **Node.js** | Runs your apps locally |
| **Git** | Version control — tracks your code changes |
| **GitHub CLI** | Connects your computer to GitHub |
| **Git config** | Sets your name and email for commits |
| **Claude Code** | AI in your terminal — autonomous building |

### Introduced During the Course
These are installed in pre-flight but we go deep on them at the right time.

| Tool | Link | When It Gets Real |
|------|------|-------------------|
| **Claude Code** | Installed in pre-flight | Introduced Session 5 — terminal AI, Skills, agent teams |
| **Supabase** | [supabase.com](https://supabase.com) | Session 2 homework (account) / Session 3 (database + MCP) |
| **Vercel** | [vercel.com](https://vercel.com) | Session 10 (deployment — your app goes live) |

## Switching From ChatGPT or Gemini?

- **Import your ChatGPT memory to Claude** — [claude.com/import-memory](https://claude.com/import-memory) — brings your context over so Claude already knows about you

## Danny's Demo Projects

See [demo-showcase-links.md](./demo-showcase-links.md) for the full list of projects shown in Session 1.

## Useful Tools (As You Progress)

These aren't required — they're tools you'll find handy as you get more comfortable.

| Tool | Link | What It's Good For |
|------|------|-------------------|
| **Gitingest** | [gitingest.com](https://gitingest.com/) | Turns any GitHub repo into text you can paste into AI — great for understanding unfamiliar code |
| **NotebookLM** | [notebooklm.google.com](https://notebooklm.google.com) | Research & knowledge tool — upload docs, ask questions |
| **Google AI Studio** | [aistudio.google.com](https://aistudio.google.com) | Quick visual prototypes with Gemini models |
| **Google Antigravity** | [antigravity.google](https://antigravity.google) | Free AI-powered IDE from Google — generous Gemini rate limits, good fallback if you hit token limits on Cursor |
| **Gemini** | [gemini.google.com](https://gemini.google.com) | Second opinions and brainstorming backup |
| **Maccy** (Mac) | [maccy.app](https://maccy.app) | Free clipboard history — see and search everything you've copied. Pairs great with Handy's auto-clipboard |
| **Ditto** (Windows) | [ditto-cp.sourceforge.io](https://ditto-cp.sourceforge.io) | Free open-source clipboard manager for Windows — same idea as Maccy |
| **GitHub Pages preview** | [Simon Willison's tip](https://til.simonwillison.net/claude-code/preview-github-pages) | Share HTML projects without deploying to Vercel |

---

## Quick Reference Cards (Coming Soon)

- [ ] Cursor Keyboard Shortcuts
- [ ] Context Management / "Fuel Tank" Guide
- [ ] "Consultant Handoff" Pattern
- [ ] Git Basics Visual Guide
