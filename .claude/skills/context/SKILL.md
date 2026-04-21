---
name: context
description: Use when the user runs /context or asks for a summary of their current context, active projects, recent state, or says "brief me" or "summarize my vault".
---

# Vault Briefing

Read King's Obsidian vault and synthesize a current-state brief.

## Reading Order

Execute in this order, in parallel where possible:

1. `Now.md` — current focus and active projects
2. `Goals.md` — Q1 goals
3. `Areas/Internship Applications.md` — active applications and interviews
4. Active projects — all files in `Projects/` where `status: active`
5. Last 7 days of `Daily Notes/` — from today's date backwards
6. Most recent `Reviews/` file

## Output Format

Respond with exactly this structure — be concise, no filler:

---

**Current Focus** (from Now.md)
- Main projects, learning, life priorities in 2-3 bullets

**Active Projects**
- One line per project: name → what it is → current state

**Internship Pipeline**
- Interviews pending / upcoming deadlines
- Notable status changes in the last 7 days

**Last 7 Days — What Actually Happened**
- Key events, completions, blockers from daily notes
- Emotional/energy signal if notable (e.g. low energy, big win)

**Open Threads**
- Unchecked todos from recent daily notes still pending
- Anything mentioned as "tomorrow" or "next" that hasn't appeared completed

**Priorities This Week** (synthesized)
- What King should focus on based on the above

---

## Rules

- Pull facts from the notes — don't invent or extrapolate
- If a daily note is missing for a day, skip it silently
- Chinese content in daily notes: read it, include relevant points in English in the summary
- Keep the whole output under 400 words
- Do not read Knowledge/, Resources/, People/, or Logs/ unless specifically relevant to an active project or interview
