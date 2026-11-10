## Specs

- SPEC.md is the project spec: stack, commands, structure, code style, testing, boundaries. It does not describe individual features.
- Run /spec only for the project. New features go through /grill-with-docs and /to-spec.
- Feature specs and tickets live in the tracker (see docs/agents/issue-tracker.md). Feature details go there, not into SPEC.md.
- Update SPEC.md only when a project-wide rule changes, such as a new dependency, command or boundary, and say so in the commit message.
- If a ticket conflicts with SPEC.md, stop and ask which one should change.
- Acceptance criteria in tickets must be specific and testable. Turn vague requirements into measurable conditions, for example "faster" into "loads in under 2.5 seconds", and confirm the numbers with the user.
- Tasks for a ticket go to tasks/todo.md, never to the tracker.

## Ticket status

- When you start planning or building a ticket, move it to In Progress in the tracker.
- Move it to Done only after its acceptance criteria are verified and the work is merged.
- Follow docs/agents/issue-tracker.md for how to update the tracker.
