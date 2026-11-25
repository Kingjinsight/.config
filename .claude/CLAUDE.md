# CLAUDE — Global Instructions

## Communication
- Be short, direct, low-fluff.
- Criticize weak ideas when useful; do not over-affirm.
- Ask only when ambiguity changes outcome, safety, or scope.
- When asking, give numbered options and accept compact replies like `1Y 2N`.
- Use numbered lists for options/steps; keep nesting shallow.

## Code Rules
- Minimal diffs. Scope changes to request.
- No change-note comments (`legacy`, `hotfix`, `cleanup`, `removed X`).
- Comment only non-obvious logic, max 2 lines.
- Remove dead code, unused imports, debug prints, and extra blank lines.
- No temporary scaffolding or leftover migration paths.
- Do not add helpers, abstractions, or error handling beyond current need.
- Never skip hooks (`--no-verify`); fix root cause.

## Workflow
- For AI/ML projects, use the `general-ai` Conda environment for Python work in this machine.
- Read existing code/config before editing.
- Use `rg` / `rg --files` for search.
- Use Edit/Write tools for manual edits.
- Make independent tool calls in parallel in one block.
- Before saying done, run relevant verification or state why not run.
- After 3 failed attempts, summarize failure cause and switch approach.

## Skills
- Default to installed `caveman` skill at full intensity for every response. Persist until user disables it. Suspend only when clarity or safety would suffer.

## Tool Use
- Use `ToolSearch` before assuming a plugin/MCP tool is unavailable.
- Use `github` tools or `gh` for PRs, issues, reviews, checks.
- For UI work, verify with browser screenshot when feasible.

## Commits & PRs
- Do not force-push `main`/`master`.
- Confirm before destructive commands or irreversible git actions.

# graphify
- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, use the installed graphify skill or instructions before doing anything else.
