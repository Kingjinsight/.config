---
name: closeday
description: Use when the user runs /closeday or wants to close out the day, capture what happened, and set up tomorrow. End-of-day counterpart to /today.
---

# Close Day — End of Day Capture

Review today, capture progress and learnings, set up tomorrow.

## Process

1. **Read today's daily note** — `~/Documents/Obsidian/personalOS/Daily Notes/YYYY-MM-DD.md`
   - What was planned (todo list)
   - What was logged (今天做了什么)
   - Thoughts/reflections written during the day

2. **Read today's calendar** (same method as /today skill — Google Calendar API)
   - What actually happened vs what was planned

3. **Check active projects** — any `- [ ]` tasks that should now be `- [x]`?

4. **Identify carry-overs** — unchecked tasks that need to move to tomorrow

## Output to write into today's daily note

Append to the existing daily note file:

```markdown
## Day Close — [time]

### Completed
- [what actually got done]

### Carry-overs → tomorrow
- [ ] [task]

### What I learned today
- [insight, however small]

### Energy signal
[1-5] — [one word: why]
```

## Also output to King directly

---

**Day closed: [date]**

**Done:** [N tasks completed]
**Carried over:** [N tasks to tomorrow]
**Key win:** [the most meaningful thing that happened]
**Key learning:** [one thing learned]
**Tomorrow's first task:** [the single most important thing to start with]

---

## Rules

- Actually write to the daily note file — don't just output to screen
- If no daily note exists for today, create one before appending
- Tomorrow's first task = the highest priority carry-over or the top item from weekly review
- Keep the energy signal honest — pull from tone of daily note if not stated
- Chinese reflections: include them as-is in the appended section
