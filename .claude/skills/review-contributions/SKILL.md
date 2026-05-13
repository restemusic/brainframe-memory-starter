---
name: review-contributions
description: "Use when the user says "review contributions", "what is pending", or "promote contributions". Owner only."
when_to_use: "Use when the user says "review contributions", "what is pending", or "promote contributions". Owner only."
disable-model-invocation: false
version: 1.0.0
---

# review-contributions

## Trust

Reads: contributions/ inbox. Writes: USER/ canonical files (on promote), contributions/_promoted/ (archive). External calls: GitHub API (GET, PUT).

## Instructions

[Skill logic goes here. This is a stub. Implement per your surface (claude-code or claude-project).]

For claude-code: execute curl calls to Supabase REST API. Load credentials from ~/.config/memory-starter/.env.

For claude-project: produce the curl command or SQL for the user to run manually.
