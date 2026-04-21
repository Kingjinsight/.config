---
name: today
description: Use when the user runs /today or asks for today's plan, priorities, or schedule. Reads daily note, calendar, tasks, and weekly context to generate a prioritized daily plan.
---

# Today — Daily Plan Generator

Synthesize King's day from vault context + calendar into an actionable prioritized plan.

## Step 1 — Read all sources in parallel

| Source | What to extract |
|--------|----------------|
| `Daily Notes/YYYY-MM-DD.md` (today) | Existing todos, notes written so far, energy signal |
| Most recent `Reviews/` file | What King said is important this week (下周最重要的 3 件事) |
| `Now.md` | 3-month priorities — what matters at the macro level |
| All `Projects/` with `status: active` | Unchecked tasks (`- [ ]`) per project |
| All `Areas/` with `status: active` | Pending actions |
| Google Calendar (see Step 2) | Today's events and time blocks |

If today's daily note doesn't exist yet, proceed without it.

## Step 2 — Read calendar

Use the Google Calendar API directly via Bash:

```bash
# 1. Get credentials from plugin config
CLIENT_ID=$(cat ~/Documents/Obsidian/personalOS/.obsidian/plugins/google-calendar/data.json | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['googleClientId'])")
CLIENT_SECRET=$(cat ~/Documents/Obsidian/personalOS/.obsidian/plugins/google-calendar/data.json | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['googleClientSecret'])")

# 2. Get refresh token from Obsidian's LevelDB (copy first to avoid lock)
cp -r '/home/kj/.config/obsidian/Local Storage/leveldb' /tmp/obsidian-ldb
REFRESH_TOKEN=$(conda run -n ai_env_3.12 python3 -c "
import plyvel
db = plyvel.DB('/tmp/obsidian-ldb')
for k, v in db:
    if b'googleCalendarRefreshToken' in k:
        print(v[1:].decode())
db.close()
")

# 3. Get fresh access token
ACCESS_TOKEN=$(curl -s -X POST "https://oauth2.googleapis.com/token" \
  -d "client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&refresh_token=$REFRESH_TOKEN&grant_type=refresh_token" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['access_token'])")

# 4. Fetch today's events
TODAY_START=$(date -u +"%Y-%m-%dT00:00:00Z")
TODAY_END=$(date -u +"%Y-%m-%dT23:59:59Z")
curl -s "https://www.googleapis.com/calendar/v3/calendars/primary/events?timeMin=${TODAY_START}&timeMax=${TODAY_END}&singleEvents=true&orderBy=startTime" \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

Extract from result: event name, start time, end time, whether it's a hard commitment.

## Step 3 — Generate prioritized plan

### Priority logic

Rank tasks using this order:
1. **Hard commitments** — calendar events, deadlines today
2. **Weekly top 3** — tasks from the most recent weekly review's 下周最重要的 3 件事
3. **Active project next steps** — unchecked todos from active projects, sorted by deadline ASC
4. **Carry-overs** — unchecked todos from yesterday's daily note
5. **Area maintenance** — pending area actions

### Time-block the day

Group into morning / afternoon / evening blocks around calendar events.
Keep it realistic — max 3-5 real tasks, not a 20-item list.

## Output Format

---

**Today — [YYYY-MM-DD, Weekday]**

**Schedule** *(calendar events)*
- HH:MM — event name

**Top 3 for today** *(from weekly review priorities)*
1.
2.
3.

**Full task list** *(ranked)*
- [ ] task — [project/area] — why today

**Suggested time blocks**
- Morning (9–12):
- Afternoon (13–17):
- Evening (18+):

**Carry-overs from yesterday** *(if any)*
-

**Note:** [anything worth flagging — low energy signal, overloaded day, missing calendar data]

---

## Rules

- Pull facts only — don't invent tasks
- Chinese content in daily notes: read it, use it for energy/mood signal
- If no weekly review exists, fall back to Now.md for weekly priorities
- Cap the task list at 7 items — ruthless prioritization over completeness
- If the day looks overloaded vs calendar time available, say so explicitly
