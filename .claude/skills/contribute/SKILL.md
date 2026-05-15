---
name: contribute
description: "Use when the user says \"contribute\", \"add a note\", or \"I want to log something\" in a Contributor session."
when_to_use: "Use when the user says \"contribute\", \"add a note\", or \"I want to log something\" in a Contributor session."
disable-model-invocation: true
version: 1.1.0
---

# contribute

## Trust

Reads: nothing. Writes: contributions/{date}-{name}-{slug}.md via GitHub API. External calls: GitHub API (PUT).

## Instructions

Load credentials:
```bash
source ~/.config/memory-starter/.env
# Expects: GITHUB_TOKEN, GITHUB_REPO (format: owner/repo)
```

Extract from context:
- `{DATE}` — today in YYYY-MM-DD
- `{NAME}` — contributor's name (from USER/people.md or ask)
- `{SLUG}` — 3-5 word kebab-case summary of the contribution
- `{BODY}` — the contribution content in markdown

Build the file path: `contributions/{DATE}-{NAME}-{SLUG}.md`

Encode content:
```bash
ENCODED=$(echo "{BODY}" | base64)
```

Push to GitHub:
```bash
curl -s -X PUT "https://api.github.com/repos/${GITHUB_REPO}/contents/contributions/{DATE}-{NAME}-{SLUG}.md" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
    \"message\": \"contrib: {NAME} — {SLUG}\",
    \"content\": \"${ENCODED}\"
  }"
```

On success (HTTP 201), confirm: "Contribution filed: contributions/{DATE}-{NAME}-{SLUG}.md"
On failure, show the full response body.

For claude-project surface: produce the curl command above for the user to run. Do not attempt to execute it.
