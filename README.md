# memory-starter

A lightweight AI memory system for Claude Projects. Fork this repo, run one script, paste instructions into Claude — done.

**What you get:** Claude that remembers across sessions. Decisions logged. Notes searchable. Works with Claude Pro (web) or Claude Code (CLI).

**Stack:** GitHub (canonical store) + Supabase free tier (queryable store) + Claude Project instructions (boot surface).

---

## Quickstart

1. Click **Use this template** → create your own repo (e.g. `my-memory`)
2. Clone it locally
3. Run `bash scripts/onboard.sh`
4. Paste contents of `SYSTEM/PROJECT_INSTRUCTIONS_OWNER.md` into a new Claude Project
5. Done. Open Claude and type `boot`.

Full guide: [docs/agent-guides/onboarding.md](docs/agent-guides/onboarding.md)

---

## File Layout

```
CLAUDE.md                           Boot file — paste into Claude Project instructions
SYSTEM/                             Template-managed. Never edit manually.
  GLOBAL_RULES.md                   Claude's universal rules
  PROJECT_INSTRUCTIONS_OWNER.md     Paste into your Claude Project
  PROJECT_INSTRUCTIONS_CONTRIBUTOR.md
  PROJECT_INSTRUCTIONS_READER.md
USER/                               Yours. Customize freely. Never overwritten by upstream.
  routing/
    facts.md                        Immutable facts about your context
    preferences.md                  How you like Claude to behave
    decisions.md                    Append-only decision log
    sessions.md                     Rolling last-5 session summaries
  people.md                         Collaborators, clients, contacts
  topics/                           Per-topic folders
contributions/                      Inbox — contributors write here, owner promotes
.claude/
  settings.json                     Claude Code deny rules (Claude Code users only)
  skills/                           Skill stubs
scripts/
  onboard.sh                        One-command setup
  migrations/
    001-initial-schema.sql          Supabase schema — idempotent
docs/
  agent-guides/
    memory-architecture.md
    onboarding.md
    maintenance.md
```

---

## Roles

| Role | Can do |
|------|--------|
| Owner | Read + write everything. Promotes contributions. |
| Contributor | Writes to `contributions/` inbox only. |
| Reader | Read-only queries via Claude. |

Solo? You are the Owner. Skip Contributor and Reader.

---

## System vs User files

**Never edit `SYSTEM/`.** It receives upstream updates as PRs you review and merge. Your content lives in `USER/`, `contributions/`, and your topics.

See [Receiving Updates](docs/agent-guides/onboarding.md#receiving-updates).

---

## Requirements

- GitHub account + basic git
- Supabase account (free tier)
- Claude Pro or Team plan
- bash + curl (for onboarding script)

Windows users: run via WSL or follow the manual steps in [docs/agent-guides/onboarding.md](docs/agent-guides/onboarding.md).

---

## Surface

Claude Code (CLI): full read/write via curl to Supabase REST API. Credentials stored at `~/.config/memory-starter/.env`.

claude.ai Projects (web/mobile): Claude produces SQL or curl commands for you to run. No direct HTTP from the browser session.

---

Built on Brainframe admin memory architecture. Stripped for public distribution.
