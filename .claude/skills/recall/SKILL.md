---
name: recall
description: "Use when the user asks to find, search, recall, or look up anything from memory."
when_to_use: "Use when the user asks to find, search, recall, or look up anything from memory."
disable-model-invocation: false
version: 1.1.0
---

# recall

## Trust

Reads: Supabase (decisions, specs, topics, people, contributions tables). Writes: nothing. External calls: Supabase REST API (read-only).

## Instructions

Load credentials:
```bash
source ~/.config/memory-starter/.env
# Expects: SUPABASE_URL, SUPABASE_ANON_KEY
```

Search decisions:
```bash
curl -s "${SUPABASE_URL}/rest/v1/decisions?summary=ilike.*{QUERY}*&select=id,summary,outcome,created_at&order=created_at.desc&limit=10" \
  -H "apikey: ${SUPABASE_ANON_KEY}" \
  -H "Authorization: Bearer ${SUPABASE_ANON_KEY}"
```

Search specs:
```bash
curl -s "${SUPABASE_URL}/rest/v1/specs?title=ilike.*{QUERY}*&select=id,title,status,created_at&order=created_at.desc&limit=10" \
  -H "apikey: ${SUPABASE_ANON_KEY}" \
  -H "Authorization: Bearer ${SUPABASE_ANON_KEY}"
```

Search topics:
```bash
curl -s "${SUPABASE_URL}/rest/v1/topics?title=ilike.*{QUERY}*&select=id,title,body,created_at&order=created_at.desc&limit=10" \
  -H "apikey: ${SUPABASE_ANON_KEY}" \
  -H "Authorization: Bearer ${SUPABASE_ANON_KEY}"
```

Search people:
```bash
curl -s "${SUPABASE_URL}/rest/v1/people?name=ilike.*{QUERY}*&select=id,name,role,notes&limit=10" \
  -H "apikey: ${SUPABASE_ANON_KEY}" \
  -H "Authorization: Bearer ${SUPABASE_ANON_KEY}"
```

Replace `{QUERY}` with the user's search term. Run all four in parallel; present combined results grouped by table. If no results, say so plainly.

For claude-project surface: produce the curl commands above for the user to run in their terminal. Do not attempt to execute them.
