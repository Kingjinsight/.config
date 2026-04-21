---
name: graduate
description: Use when the user runs /graduate or asks to extract undeveloped ideas from daily notes and promote them into standalone Knowledge or Project notes.
---

# Graduate — Promote Ideas from Daily Notes

Scan recent daily notes for half-formed thoughts worth developing, and create standalone notes for them.

## Process

1. **Read the last 14 days of daily notes**
   - Files in `~/Documents/Obsidian/personalOS/Daily Notes/` sorted by date, last 14 entries

2. **Identify graduation candidates** — ideas that:
   - Appear more than once across different days
   - Are phrased as a claim or insight (not just a task or log)
   - Have enough substance to stand alone (more than one sentence of actual thought)
   - Haven't already been developed into a `~/Documents/Obsidian/personalOS/Knowledge/` or `~/Documents/Obsidian/personalOS/Projects/` note

3. **For each candidate, determine the right destination**
   - Insight or concept → `~/Documents/Obsidian/personalOS/Knowledge/` note
   - Repeating intention or plan → `~/Documents/Obsidian/personalOS/Projects/` or `~/Documents/Obsidian/personalOS/Areas/` note
   - Something to explore → `~/Documents/Obsidian/personalOS/Someday Maybe.md` addition

4. **Create the note** for each candidate using the appropriate template structure:
   - Knowledge note: What is this / My understanding / Why it matters / Connections
   - Project note: Goal / Next Steps / Related Notes

5. **Link back** — add a link to the new note from the daily note where the idea first appeared

## Output Format

Tell King what you found and what you created:

---

**Graduate Report — [date range]**

**Promoted to ~/Documents/Obsidian/personalOS/Knowledge/**
- [[New Note Title]] — *from [date daily note], "[brief quote of the original thought]"*

**Promoted to ~/Documents/Obsidian/personalOS/Projects/ or ~/Documents/Obsidian/personalOS/Areas/**
- [[New Note Title]] — *from [date daily note], "[brief quote]"*

**Added to Someday Maybe**
- [item] — *from [date daily note]*

**Left in daily notes** (not yet ready)
- "[thought]" — [why it needs more development first]

---

## Rules

- Don't over-promote — a half-sentence doesn't deserve its own note
- The note content should be King's words expanded, not Claude's summary
- Chinese thoughts in daily notes: include them, expand in English with Chinese preserved
- Don't create notes for tasks — only for ideas and insights
- Maximum 5 promoted notes per run — quality over quantity
