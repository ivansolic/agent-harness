# Issue tracker: Jira

Issues and specs for this repo live in Jira. Use the Atlassian (Jira) MCP tools available in this session for all operations. If no Jira tools are available, stop and tell the user to connect Atlassian; do not fall back to another tracker.

## Workspace

- **Site**: <SITE>.atlassian.net
- **Project key**: <KEY> (file every spec and ticket for this repo into this project)

## Conventions

- **Spec**: one Epic. The spec text is the Epic description.
- **Ticket**: one Story per vertical slice, with the Epic as its parent. Acceptance criteria go in the Story description.
- **Blocking**: use the Jira issue link type "Blocks" / "is blocked by". A ticket is unblocked when every blocker is in a Done status category.
- **Labels**: apply `ready-for-agent` to tickets an agent can start without further questions, `ready-for-human` to tickets that need a person.
- **Status**: new tickets stay in the project's initial status. Transition a ticket only through the transitions the workflow offers; move it to Done only after its acceptance criteria are verified.
- **Required fields**: before the first create, read the field metadata for the issue type and ask the user for any required field you cannot fill.
- **Comment, don't rewrite**: add progress and decisions as comments. Edit the description only to fix the spec itself.

File issues only into the project named above. Show the user the list of issues you are about to create and wait for a yes before the first write of a session.

## When a skill says "publish to the issue tracker"

Create a Jira issue as described above.

## When a skill says "fetch the relevant ticket"

Read the Jira issue with its description, labels, links, and comments.
