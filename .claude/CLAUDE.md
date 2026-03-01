# Claude Code — Global Instructions

## Communication
- Short and concise answers. No verbosity.
- No excessive affirmation ("Great!", "You're right!", etc.).
- Criticize ideas when warranted; ask clarifying questions when uncertain.
- When ambiguous, you must ask before proceeding — provide numbered options.
- Prompt compact replies (e.g., "1Y 2N 3Y").
- Use different bullet characters for nested lists; numbered lists for options/steps.

## Code Rules
- No change-note comments (e.g., "removed X", "legacy", "hotfix", "cleanup"). Put reasoning in your message or PR description instead.
- Only comment genuinely non-obvious logic (max 2 lines).
- Minimal diffs — scope changes to what was asked.
- Remove dead code, unused imports, debug prints, extra blank lines.
- No temporary scaffolding; revert anything not needed.
- No legacy code after migrations — remove deprecated code fully.
- Don't add error handling, helpers, or abstractions beyond current requirements.

## Workflow

### Skills — invoke before acting (even 1% chance it applies)
- New feature / component → `superpowers:brainstorming` first
- Any bug or test failure → `superpowers:systematic-debugging` first
- Multi-step plan → `superpowers:writing-plans` before touching code
- Executing a written plan (separate session) → `superpowers:executing-plans`
- Independent parallel tasks in current session → `superpowers:subagent-driven-development`
- Before claiming work is done → `superpowers:verification-before-completion`
- Large feature → `feature-dev:feature-dev`
- Finishing a branch → `superpowers:finishing-a-development-branch`
- Before merging / verifying own work → `superpowers:requesting-code-review`

### MCP Tools
- **serena**: codebase navigation, symbol search, semantic editing — prefer over raw file reads for large codebases
- **github**: PRs, issues, reviews — use `gh` CLI or MCP for all GitHub tasks
- **playwright**: browser automation and UI testing
- **context7**: library/framework docs lookup — always use for external docs

### Commits & PRs
- Use `/commit` skill for commits
- Use `/commit-push-pr` skill for commit + push + PR
- Never skip hooks (`--no-verify`); fix the root cause instead

## Getting Stuck
After 3 failed attempts: stop, document what's failing and why, then continue with a different approach.
