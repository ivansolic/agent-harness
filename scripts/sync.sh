#!/usr/bin/env bash
# Pulls fresh versions of the skills from their source repos. Review `git diff` before committing.
# Exit code 1 means subagent-build was not updated because the patch no longer applies.
set -euo pipefail
cd "$(dirname "$0")/.."
root=$PWD
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
git clone --depth 1 -q https://github.com/mattpocock/skills "$tmp/matt"
git clone --depth 1 -q https://github.com/cursor/plugins "$tmp/cursor"
git clone --depth 1 -q https://github.com/obra/superpowers "$tmp/sp"

copy() { rm -rf "skills/$(basename "$1")"; cp -r "$1" skills/; }

# Copied unchanged
for s in productivity/grill-me productivity/grilling productivity/handoff productivity/writing-for-agents \
         engineering/grill-with-docs engineering/domain-modeling engineering/to-spec engineering/to-tickets \
         engineering/prototype engineering/setup-matt-pocock-skills; do
  copy "$tmp/matt/skills/$s"
done
for s in principle-prove-it-works blast-radius create-verification-skill reflect unslop; do
  copy "$tmp/cursor/harness/pstack/claude-code/skills/$s"
done
copy "$tmp/sp/skills/using-git-worktrees"

# subagent-build = fresh upstream subagent-driven-development + our patch
status=0
new="$tmp/subagent-build"
cp -r "$tmp/sp/skills/subagent-driven-development" "$new"
cp "$tmp/sp/skills/requesting-code-review/code-reviewer.md" "$new/final-reviewer-prompt.md"
if (cd "$new" && git apply -p2 "$root/patches/subagent-build.patch"); then
  cp patches/subagent-build-CHANGES.md "$new/CHANGES.md"
  rm -rf skills/subagent-build
  cp -r "$new" skills/subagent-build
else
  echo "WARNING: the subagent-build patch no longer applies to the new superpowers version." >&2
  echo "subagent-build was left at its previous version. Update the patch by hand." >&2
  status=1
fi

for r in matt cursor sp; do echo "$r: $(git -C "$tmp/$r" rev-parse --short HEAD) ($(git -C "$tmp/$r" log -1 --format=%cs))"; done
echo "Done. Review with: git status and git diff --stat"
exit $status
