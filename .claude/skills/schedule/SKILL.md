---
name: schedule
description: Use when the user runs /schedule or asks for weekly time allocation, wants to map priorities to actual calendar time, or needs to spot conflicts between stated priorities and how they're spending time.
---

# Schedule — Map Priorities to Time

Read King's priorities and calendar, then suggest a realistic weekly schedule. Flag gaps between what he says matters and where his time actually goes.

## Process

1. **Read priorities**
   - `~/Documents/Obsidian/personalOS/Now.md` — 3-month focus
   - `~/Documents/Obsidian/personalOS/Goals.md` — quarterly goals
   - Most recent `~/Documents/Obsidian/personalOS/Reviews/` — top 3 for the week
   - Active `~/Documents/Obsidian/personalOS/Projects/` — next steps and deadlines

2. **Read this week's calendar** (Google Calendar API — same method as /today)
   ```bash
   # Fetch Mon–Sun of current week
   WEEK_START=$(date -d "monday" +"%Y-%m-%dT00:00:00Z" 2>/dev/null || date -v+Mon +"%Y-%m-%dT00:00:00Z")
   WEEK_END=$(date -d "sunday" +"%Y-%m-%dT23:59:59Z" 2>/dev/null || date -v+Sun +"%Y-%m-%dT23:59:59Z")
   ```
   Extract: fixed commitments, their duration, which days are heavy vs light

3. **Calculate available time** — total hours minus fixed commitments

4. **Allocate remaining time** to priorities by importance order:
   - Weekly top 3 first
   - Active project next steps second
   - Area maintenance third

5. **Spot conflicts** — where stated priorities have no time allocated

## Output Format

---

**Weekly Schedule — [week of date]**

**Fixed commitments**
| Day | Time | Event | Hours |
|-----|------|--------|-------|
| Mon | 10:31 | AI Automation Intern Interview | 1h |
| ... | ... | ... | ... |

**Available focus time:** ~[N] hours across the week

**Suggested allocation**
| Priority | Time needed | Suggested slot |
|----------|-------------|---------------|
| [top priority] | 3h | Tue morning, Thu afternoon |
| [project next step] | 2h | Wed morning |
| ... | ... | ... |

**Conflicts flagged**
- "[stated priority]" has no time allocated this week
- [heavy day] is overloaded — consider moving [X] to [lighter day]

**Honest assessment**
[1-2 sentences: is this week's schedule realistic given the priorities? What's the biggest gap?]

---

## Rules

- Be realistic — a "focus block" requires no back-to-back meetings before/after it
- Flag overload explicitly — don't just fill in the schedule if it's too full
- The honest assessment should name the real constraint, not soften it
- If calendar data is unavailable, say so and work from stated priorities only
