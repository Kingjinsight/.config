---
name: connect
description: Use when the user runs /connect [topic A] [topic B] or asks to find connections between two ideas, domains, or subjects in the vault.
---

# Connect — Bridge Two Ideas

Find unexpected connections between two topics using King's vault as the link graph.

## Input

`/connect [topic A] [topic B]`
If missing, ask for both topics.

## Process

1. **Search for each topic independently**
   ```bash
   grep -ril "[topic A]" ~/Documents/Obsidian/personalOS/ --include="*.md"
   grep -ril "[topic B]" ~/Documents/Obsidian/personalOS/ --include="*.md"
   ```

2. **Find overlapping notes** — files that mention both topics directly

3. **Find bridge notes** — files that mention topic A and link to files that mention topic B (one degree of separation)

4. **Read the bridge notes** — understand what concept actually connects the two topics

5. **Look for structural patterns** — same folder, same tags, same time period, same linked notes

## Output Format

---

**Connecting: [Topic A] ↔ [Topic B]**

**Direct overlaps** *(notes mentioning both)*
- [[note]] — [how they appear together]

**Bridge notes** *(one step between them)*
- [[note A]] → [[note B]] — [the connecting concept]

**The pattern**
[1-2 sentences: what actually links these two things in King's thinking]

**Unexpected connection**
[The most surprising or non-obvious link found]

**Possible implication**
[What this connection could mean — a project idea, a belief to examine, a question to explore]

---

## Rules

- Be specific — name actual notes and actual quotes
- If no connection found, say so directly and suggest what's missing
- The unexpected connection is the most valuable output — don't skip it
