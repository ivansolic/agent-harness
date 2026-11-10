# agent-harness

A Claude Code plugin: a curated set of skills that runs on top of addyosmani/agent-skills. See README.md.

## Rules for changing this repo

- Skills under `skills/` are copies from their source repos (see SOURCES.md). Don't edit them: `scripts/sync.sh` overwrites them on every sync. To change a copied skill, stop copying it and move it to a new name as our own skill.
- `skills/subagent-build/` is the exception. It is rebuilt from superpowers with `patches/subagent-build.patch`. To change it, change the patch and `patches/subagent-build-CHANGES.md`, then run `bash scripts/sync.sh` and check the result.
- Our own skills go in `skills/` under names that no source repo uses, and must not appear in the copy lists in `scripts/sync.sh`.
- Adding or removing a copied skill means updating all of: the lists in `scripts/sync.sh`, SOURCES.md, and the tables in README.md.
- Templates in `templates/` are copied into other projects by hand. Keep them generic: no company names, workspace IDs or personal details.
- Everything in this repo is in English.
- Bump `version` in both `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` when skills change.
