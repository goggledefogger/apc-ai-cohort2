# Pre-Flight Setup Guide

**APC AI Builder's Course (Cohort 2) — Complete Before Session 1**

Everything you need installed, configured, and verified so you arrive on Day 1 ready to build.

---

## Before You Start

**What you need:**
- A Mac, Windows, or Linux computer
- Reliable internet connection
- A password manager ([1Password](https://1password.com) or [Bitwarden](https://bitwarden.com)) — stores passwords, generates OTP codes for two-factor auth, and supports passkeys for passwordless login. Worth setting up if you don't have one already.

> **Tip:** You'll create several accounts during this guide. Save each one in your password manager as you go — you'll need them in class.

---

## Your Stack at a Glance

| Service | What It Does | Cost |
|---------|-------------|------|
| **Cursor** | AI-powered code editor — your primary tool | $60/mo (Pro Plus) |
| **Claude** | AI assistant + powers Claude Code | $20/mo (Pro) |
| **GitHub** | Cloud storage for your code | Free |
| **Handy** | Voice dictation — talk to AI naturally | Free & open source |

> **Realistic budget:** ~$80/month (Cursor Pro Plus + Claude Pro). Other tools like Supabase (database) and Vercel (deployment) are free — we'll set those up together in class when we need them.

---

## Step 1: Create Your Accounts

You'll need three accounts. Create each one and save the login in your password manager.

### GitHub
1. Go to [github.com](https://github.com) and sign up
2. Use a professional email — this account will be on your portfolio
3. Choose a username you'd be comfortable sharing with an employer

### Claude Pro
1. Go to [claude.ai](https://claude.ai) and create an account
2. **Subscribe to Claude Pro ($20/month)** — required for Claude Code, which we use throughout the course. Also gives you access to Claude's full suite of tools at claude.ai, including some of the most capable and reliable AI models available.

### Cursor
1. Go to [cursor.com](https://cursor.com) and create an account
2. **Subscribe to Cursor Pro Plus ($60/month)** — you can do this now on the website or during install in the next step. The standard Pro plan ($20) works, but you'll hit usage limits quickly during heavy building sessions. Pro Plus gives you 3x the usage.

---

## Step 2: Install Cursor and Open Your First Folder

Cursor is your primary tool for the entire course — an AI-powered code editor where you'll do nearly all of your building.

### Install

1. Download from [cursor.com/download](https://cursor.com/download)
2. **Mac:** Drag Cursor to your **Applications** folder (not Downloads). **Windows:** Run the installer. **Linux:** Follow the install instructions for your distro.
3. Open Cursor and **sign in with the Cursor account you just created**
4. Confirm your Pro Plus subscription is active — check Cursor Settings > Account

### Your First Folder

When Cursor opens for the first time, you'll see an empty window. **Cursor needs a folder open to do anything useful** — its AI only sees files inside whatever folder you have open. This is the #1 thing to remember:

> **No folder open = AI can't help you.**

Here's how to get started:

5. **Create your course folder.** Open Finder (Mac), File Explorer (Windows), or your file manager (Linux). Create a new folder on your Desktop called `AI-Projects`. This is your home base for the course — all your projects will live inside it.
6. **Open it in Cursor:** Back in Cursor, go to **File > Open Folder** and select the `AI-Projects` folder you just created. You should see the folder name in the Explorer panel on the left side. It'll be empty — that's fine.

You'll use **File > Open Folder** every time you start working. Get used to it now — it's the first thing you do when you open Cursor.

### Set Your AI Model

7. Open Cursor Settings (gear icon or `Cmd+,` / `Ctrl+,`)
8. In the AI model selector, choose **Claude Sonnet 4.6** for everyday coding tasks
9. For complex architecture or debugging, switch to **Claude Opus 4.6** — noticeably better on difficult problems
10. Don't leave it on "Auto" when you need precision

### Troubleshooting

| Problem | Fix |
|---------|-----|
| "App can't be opened" (Mac) | System Settings > Privacy & Security > "Open Anyway" |
| Cursor feels slow | Close other heavy apps — Cursor needs decent RAM |
| AI seems confused or references files that don't exist | Check which folder is open in the Explorer panel (left sidebar). File > Open Folder to fix it. |

---

## Step 3: Let Cursor Set Up Your Dev Tools

Now you're in Cursor with a folder open. This is where it starts to get fun — instead of manually downloading and installing a bunch of tools yourself, you're going to tell Cursor what you need and let it do the work. This is your first taste of the core course workflow: describe what you need, let AI do it, verify the results.

1. Open Cursor Chat: **`Cmd+L`** (Mac) or **`Ctrl+L`** (Windows/Linux). A chat panel will open on the right side.
2. Paste this prompt into the chat (don't worry about understanding every line — Cursor does):

```
I'm a beginner setting up my development environment for a course on building software with AI. I need these tools installed and configured. Check what I already have, install what's missing, and verify each one works.

1. **Node.js** (v20+) — if missing, install via Homebrew on Mac, winget on Windows, or apt/dnf on Linux
2. **Git** — if missing, install via Xcode Command Line Tools on Mac, winget on Windows, or package manager on Linux
3. **GitHub CLI** (`gh`) — install and then run `gh auth login` (I'll choose GitHub.com > HTTPS > Login with web browser and handle the browser auth)
4. **Git config** — set my user.name and user.email (ask me for these)

For each step: check first, skip if already installed, install if missing, verify it works.
If anything needs my password or browser interaction, tell me what to do.
```

3. **Approve each step** as Cursor runs the commands. It will ask before running anything — just click to approve.
4. When it asks for your **name and email** for git config, use the same email you used for GitHub.
5. For **`gh auth login`**, Cursor will show you a short code. Copy the code, it'll open a browser window — paste it there, click Authorize, then come back to Cursor.

> **Why this way?** You're learning the core workflow of the course right now: describe what you need, let AI do it, verify the results. The tools get installed *and* you practice the skill. Two birds, one prompt.

### Verify everything got installed

Once Cursor finishes installing, let's make sure everything actually worked. Paste this into Cursor Chat:

```
Can you verify that all of these are installed and working? Check each one and tell me the result in plain English:

1. Node.js (should be v20 or higher)
2. Git
3. GitHub CLI — and am I logged in?
4. Git config — is my name and email set?

If anything is missing or not working, help me fix it.
```

Cursor will check each one and tell you what's good and what (if anything) needs attention.

### About passwords (Mac/Linux)

During this process, some installs may ask for your system password. When you see `Password:` in the terminal, type your password and press Enter. **The characters won't appear as you type — no dots, no stars, nothing.** That's completely normal — it's a security feature. Just type it and hit Enter.

### Troubleshooting

| Problem | Fix |
|---------|-----|
| Cursor says `brew: command not found` (Mac) | Tell Cursor Chat: "Install Homebrew first, then continue" |
| `winget` not found (Windows) | Tell Cursor Chat: "Use an alternative install method" — it will adapt |
| `gh auth login` device code expired | Run `gh auth login` again — codes are time-limited |
| Cursor terminal shows `command not found` after install | Fully quit and reopen Cursor, then check again |

---

## Step 4: Install & Launch Claude Code

Claude Code is another AI assistant — but instead of living in a chat panel like Cursor's AI, it runs in something called the **terminal**. The terminal is that text-only window that looks a little like a computer from 1986 — dark background, blinking cursor, no buttons. That's exactly what it's supposed to look like. Don't worry, you'll get comfortable with it quickly.

Think of Claude Code as a second AI helper that's especially good at running commands and building things. You'll use it a lot in the course.

### Install Claude Code

1. Open Cursor Chat: **`Cmd+L`** (Mac) or **`Ctrl+L`** (Windows/Linux)
2. Paste this prompt:

```
I'm a beginner and I need to install Claude Code (a terminal-based AI assistant). Please install it for me using the official installer:

curl -fsSL https://claude.ai/install.sh | bash

After it finishes, check that it worked by running: claude --version

If that install method doesn't work, try this instead: npm install -g @anthropic-ai/claude-code

Walk me through what's happening in simple terms.
```

3. **Approve** when Cursor asks to run the command.

### Launch Claude Code

Now let's make sure it works. Here's the trick you'll use constantly in this course: whenever you see a command in a gray box, **just copy the text inside it and paste it into Cursor Chat.** Think of it like an Oreo — the gray box is the cookie, but the text inside is the cream. That's the part you want.

4. Paste this into Cursor Chat:

```
Open a terminal and run `claude` to launch Claude Code. It will ask me to log in — just run the command and I'll handle the login prompts.
```

5. Follow the prompts to connect it to your Claude Pro subscription
6. Once it's running, try asking it something simple. Just type: **What folder am I in?** and press Enter.
7. When you're done, type `/exit` and press Enter to close Claude Code for now

### Troubleshooting

| Problem | Fix |
|---------|-----|
| `claude: command not found` | Fully quit and reopen Cursor, then try again. If it still fails, ask Cursor Chat: "Install Claude Code using npm instead" |
| Authentication fails | Make sure you have an active Claude Pro subscription at [claude.ai](https://claude.ai) |

---

## Step 5: Verify Everything + Set Up Voice Dictation

You've got Cursor working and your dev tools installed. Now we're going to do two things: make sure everything is actually set up correctly, and install one more tool — a voice dictation app that lets you talk to AI instead of typing.

### Install Handy (voice dictation)

[Handy](https://handy.computer) is a free, open-source voice dictation app. It runs entirely on your computer, so your voice never leaves your machine.

**How it works:** By default, Handy uses **push-to-talk** — you **hold** the keyboard shortcut while you speak, then **release** to stop (like a walkie-talkie). If you prefer **toggle mode** (press once to start, press again to stop), open Handy's settings and turn off Push-to-Talk. Either way works great — pick whichever feels more natural.

1. Open Cursor Chat: **`Cmd+L`** (Mac) or **`Ctrl+L`** (Windows/Linux)
2. Paste this prompt:

```
I need help installing Handy, a free voice dictation app that works offline.

**Mac:** Run `brew install --cask handy` (if brew isn't installed, install Homebrew first). Or download the .dmg from https://github.com/cjpais/Handy/releases/latest

**Windows:** Download the installer from https://github.com/cjpais/Handy/releases/latest — tell me which file to pick.

After installing, check that the app is available. Let me know if I need to grant any permissions.
```

3. **Approve** when Cursor asks to run the command.
4. **Grant permissions** when prompted — Handy needs **Microphone** access (to hear you) and **Accessibility** access (to paste text into other apps).
5. Open Handy, hold the keyboard shortcut, say something, and release. Your words should appear wherever your cursor is.

> **Why voice?** Talking is faster than typing, especially for describing what you want to build. Once you get comfortable with Handy, you'll use it for everything — prompts, describing bugs, brainstorming. It becomes second nature.

### Tips

- **You'll see a small graphic** at the bottom of your screen while Handy is recording — that's how you know it's listening.
- **Auto-clipboard:** Handy copies each transcription to your clipboard automatically. If your cursor wasn't in the right spot, just click where you meant to be and press **Cmd+V** / **Ctrl+V** to paste. Nothing lost.
- **History:** Handy keeps a history of your dictations with both the text and the original audio. Check Handy's settings to browse it.
- **All local:** Your audio and transcriptions stay on your computer — nothing is sent to the cloud.
- **Bonus: clipboard history.** Since Handy copies to your clipboard, a clipboard history app is a great companion — it lets you scroll back through everything you've copied. Try [Maccy](https://maccy.app) (Mac, free) or [Ditto](https://ditto-cp.sourceforge.io) (Windows, free & open source).

### Troubleshooting Handy

| Problem | Fix |
|---------|-----|
| "App can't be opened" (Mac) | System Settings > Privacy & Security > "Open Anyway" |
| Nothing happens when I speak | Check System Settings > Privacy & Security > Microphone — make sure Handy is listed and enabled |
| Text doesn't appear in other apps | Check System Settings > Privacy & Security > Accessibility — make sure Handy is listed and enabled |
| Windows SmartScreen warning | Click "More Info" > "Run Anyway" — it's an unsigned open-source app, which is normal |

### Install the setup helper skills

First, we need to give Claude Code a few "helper skills" — small files that teach it how to guide you through setup tasks. You already know the drill from Step 3: paste a prompt into Cursor Chat and let it handle the details.

1. Open Cursor Chat: **`Cmd+L`** (Mac) or **`Ctrl+L`** (Windows/Linux)
2. Paste this prompt:

```
I need to set up two helper files for Claude Code. These teach it how to check my setup. Please:

1. Create this folder if it doesn't exist: ~/.claude/commands
2. Download these two files into that folder:
   - https://raw.githubusercontent.com/goggledefogger/apc-ai-cohort2/main/skills/course-preflight.md
   - https://raw.githubusercontent.com/goggledefogger/apc-ai-cohort2/main/skills/preflight-check.sh

Tell me what you're doing at each step so I can follow along.
```

3. **Approve each step** as Cursor runs the commands. It will ask before doing anything.

> **What just happened?** You just installed helper skills that teach Claude Code how to guide you through setup verification. Think of it like giving it a playbook — now when you ask it to check your setup, it knows exactly what to look for and how to help.

### Run the pre-flight check

Now it's time to hand things off to Claude Code. This is the fun part — you're going to tell it to run through the full setup checklist, and it'll take it from there.

4. Paste this into Cursor Chat:

```
Open a terminal and run `claude` to start Claude Code. Once it's running, type `/course-preflight` and press Enter. It will run through my setup checklist.
```

That's it. Claude Code will:
- **Check every tool** you installed in the previous steps and confirm they're working
- **Verify Handy is installed** and ready to use
- **Help you fix anything** that isn't right — just follow along and answer its questions

When it's done, you'll get a clear summary of what passed and what (if anything) still needs attention. If something didn't pass, fix what it suggests and run `/course-preflight` again — it'll re-check everything.

> **This is the course workflow.** You just described what you needed, let AI do the work, and verified the results. You'll do this over and over in class — it never gets old.

---

## Final Checklist

If `/course-preflight` gave you all green, you're nearly done. There are just a few things it can't check on its own — confirm these manually:

- [ ] **Cursor subscription** — Signed in with Pro Plus ($60/mo) active. Check at Cursor Settings > Account.
- [ ] **AI model** — Set to Claude Sonnet 4.6 in Cursor Settings (gear icon or `Cmd+,` / `Ctrl+,`).
- [ ] **Claude Pro subscription** — Active at [claude.ai](https://claude.ai) > Settings.

That's it. If everything above is checked off and your pre-flight passed, you're ready for Session 1.

---

## Check-In Before Session 1

Your instructors will check in with the class **a day or two before Session 1** to make sure everyone is set up and comfortable. If you're stuck on any step — even if it feels silly — that's the time to say something. We'd much rather sort it out before class than spend session time troubleshooting.

If you hit a wall during setup, don't spiral. Just note where you got stuck and let us know. This stuff can be finicky the first time, and that's completely normal. We'll get it sorted.
