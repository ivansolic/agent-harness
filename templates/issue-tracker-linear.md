# Issue tracker: Linear

Issues and specs for this repo live in Linear. Use the Linear MCP tools available in this session for all operations. If no Linear tools are available, stop and tell the user to connect Linear; do not fall back to another tracker.

## Workspace

- **Team**: <TEAM NAME OR KEY>
- **Project**: <PROJECT NAME> (file every spec and ticket for this repo into this project)

## Conventions

- **Spec**: one Linear issue (or project document) titled `Spec: <feature>`. It is the parent of every ticket cut from it.
- **Ticket**: one Linear issue per vertical slice, created as a sub-issue of the spec.
- **Blocking**: use Linear's native "blocked by" relation between issues. A ticket is unblocked when every blocker is Done or Canceled.
- **Labels**: apply `ready-for-agent` to tickets an agent can start without further questions, `ready-for-human` to tickets that need a person. Create the labels if they do not exist.
- **Status**: new tickets go to the team's backlog state. Move a ticket to In Progress when work starts and to Done only after its acceptance criteria are verified.
- **Comment, don't rewrite**: add progress and decisions as comments. Edit the description only to fix the spec itself.

File issues only into the team and project named above. Confirm with the user before the first write of a session.

## When a skill says "publish to the issue tracker"

Create a Linear issue as described above.

## When a skill says "fetch the relevant ticket"

Read the Linear issue with its description, labels, relations, and comments.
