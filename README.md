# agent-harness

A small, curated set of agent skills for Claude Code that runs on top of [Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills).

Addy's pack covers the full development lifecycle: spec, plan, build, test, review, ship. This repo adds what it leaves out: sharpening requirements before anything is written, turning them into tickets in Jira or Linear, proving the work actually runs, and building large plans with a fresh subagent per task.

Installing every skill pack at once gives you well over a hundred skills, many of them overlapping. This repo takes the few that fill real gaps and leaves the rest.

## Credits

None of the skills here are mine. They are copied from their authors, unchanged except where noted, under the MIT license:

| Author | Repo | Skills taken |
|---|---|---|
| Matt Pocock | [mattpocock/skills](https://github.com/mattpocock/skills) | grill-me, grilling, grill-with-docs, domain-modeling, to-spec, to-tickets, prototype, handoff, writing-for-agents, setup-matt-pocock-skills |
| Lauren Tan | [pstack](https://github.com/cursor/plugins/tree/main/pstack) | principle-prove-it-works, blast-radius, create-verification-skill, reflect, unslop |
| Jesse Vincent | [superpowers](https://github.com/obra/superpowers) | using-git-worktrees, and subagent-driven-development, adapted as subagent-build |
| Addy Osmani | [agent-skills](https://github.com/addyosmani/agent-skills) | Not copied. Install it separately. |

Exact sources and commits are in [SOURCES.md](SOURCES.md). Licenses are in [licenses/](licenses/).

## Install

Install Addy's pack first, in Claude Code:

```
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
```

Then this one:

```
/plugin marketplace add ivansolic/agent-harness
/plugin install agent-harness@agent-harness
```

Turn on auto-update for both marketplaces in `/plugin` so new versions arrive on their own.

## What's inside

| Skill | Author | What it does |
|---|---|---|
| `grill-me`, `grilling` | Matt Pocock | Interviews you until a plan or idea is sharp |
| `grill-with-docs`, `domain-modeling` | Matt Pocock | The same interview, recording a glossary and decision records as it goes |
| `to-spec` | Matt Pocock | Turns the conversation into a spec and publishes it to your tracker |
| `to-tickets` | Matt Pocock | Splits a spec into tickets with dependencies |
| `prototype` | Matt Pocock | A throwaway prototype that answers one question |
| `handoff` | Matt Pocock | Summarizes a session for another agent or a fresh session |
| `writing-for-agents` | Matt Pocock | Rules for writing your own skills and CLAUDE.md files |
| `setup-matt-pocock-skills` | Matt Pocock | One-time setup per project (tracker, docs) |
| `principle-prove-it-works` | Lauren Tan | Checks the real artifact before calling anything done |
| `blast-radius` | Lauren Tan | Finds what a change can break outside its diff |
| `create-verification-skill` | Lauren Tan | Generates a skill that drives your app like a user |
| `reflect` | Lauren Tan | Turns a session's mistakes into skill updates |
| `unslop` | Lauren Tan | Removes AI phrasing from text |
| `using-git-worktrees` | Jesse Vincent | An isolated workspace; used by `subagent-build` |
| `subagent-build` | Jesse Vincent, adapted | Builds a large plan with a fresh subagent and a review per task |

## Project setup

1. Run `/setup-matt-pocock-skills` and choose "Other" for the issue tracker.
2. Copy a tracker template into the project as `docs/agents/issue-tracker.md` and fill in the workspace details:
   - Jira: `templates/issue-tracker-jira.md`
   - Linear: `templates/issue-tracker-linear.md`
3. Connect that tracker to Claude Code.

Tickets live in the tracker. The tasks inside one ticket live in `tasks/todo.md`, which Addy's `/plan` writes. Don't tell `/plan` to put tasks in the tracker: `subagent-build` reads `tasks/todo.md`.

## How to work

Match the ceremony to the stakes:

| Work | Steps |
|---|---|
| Small tweak | No skills. Make the change and look at it. |
| Small feature | `/grill-with-docs`, then `/build` |
| Large or fuzzy feature | `/grill-with-docs` → `/to-spec` → `/to-tickets` → per ticket `/plan`, `/build`, `/review` |
| Production, security, anything irreversible | All of the above, plus `doubt-driven-development`, `/blast-radius` and `/ship` |

For a plan with eight or more independent tasks, use `/subagent-build` instead of `/build auto`. It stops at every checkpoint in the plan and waits for you. `/subagent-build auto` runs through. It uses more tokens than `/build auto`.

Addy's `interview-me` and `/spec` overlap with `grill-with-docs` and `to-spec`. Use Matt's when the work goes to a tracker, Addy's when it doesn't.

When the agent gets something wrong, run `/reflect` and fix the skill.

## subagent-build

`subagent-build` is superpowers' `subagent-driven-development`, adapted to read the files Addy's `/spec` and `/plan` produce. The task loop, prompts, fix loop, ledger and model selection are unchanged. It also stops at checkpoints by default, where the original never stops. Every change is listed in [patches/subagent-build-CHANGES.md](patches/subagent-build-CHANGES.md).

## Updates

The skills here are copies, so they don't update on their own. A GitHub Action (`Sync upstream skills`) runs every Monday, pulls the latest version of each skill from its source repo, and opens a pull request if anything changed. Review the diff before merging: these are instructions your agent will follow.

To run the same sync by hand: `bash scripts/sync.sh`.

`subagent-build` is rebuilt from the latest superpowers version with `patches/subagent-build.patch` applied. If superpowers changes the lines the patch touches, the sync warns and leaves `subagent-build` at its previous version until the patch is updated.

## Using this as a template

Fork it, then change the skill lists in `scripts/sync.sh` to the skills you want. Add your own skills under `skills/`; the sync only touches the directories it copies.

## License

MIT for everything written for this repo (see [LICENSE](LICENSE)). Each copied skill stays under its author's MIT license (see [licenses/](licenses/)).
