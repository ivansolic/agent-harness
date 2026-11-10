# Changes from upstream

Source: `skills/subagent-driven-development` in obra/superpowers, commit
22f0b46 (2026-11-03), MIT. `final-reviewer-prompt.md` is
`skills/requesting-code-review/code-reviewer.md` from the same commit, copied
unchanged.

The task loop, the prompts, the fix loop, the ledger, and model selection are
unchanged. These are the only differences:

| File | Change |
|---|---|
| `SKILL.md` | Renamed to `subagent-build`; user-invoked only (`disable-model-invocation`). |
| `SKILL.md` | New **Inputs** section: the plan is `tasks/todo.md`, with `tasks/plan.md`, the spec, and `CONSTRAINTS.md` mapped onto the upstream terms. |
| `SKILL.md` | New **Checkpoints** section: stops at each `## Checkpoint:` block unless invoked with `auto`. Upstream never stops between tasks. |
| `SKILL.md` | Completing a task also ticks its checkboxes in `tasks/todo.md`. |
| `SKILL.md`, `references/final-review.md` | Finish hands off to the agent-skills `/review` and `/ship` instead of `superpowers:finishing-a-development-branch`. |
| `references/final-review.md` | Final reviewer prompt is read from this skill's own directory. |
| `SKILL.md`, `references/resuming.md`, `scripts/*` | Workspace moved from `.superpowers/sdd/` to `.sdd/`. |
| `scripts/task-brief` | A `## Checkpoint` heading ends the task being extracted. |
| `references/*.md` | "Part of superpowers:subagent-driven-development" reads "Part of subagent-build". |

These changes live as a patch in `patches/subagent-build.patch` at the repo
root. `scripts/sync.sh` copies the new upstream version and applies the patch.
If the patch no longer applies, update it by hand to match the rows above.
