#!/usr/bin/env bash
set -euo pipefail

branch="$(git rev-parse --abbrev-ref HEAD)"
tracked_count="$(git ls-files | wc -l | tr -d ' ')"
modified_count="$(git status --short | wc -l | tr -d ' ')"
untracked_count="$(git status --short | awk '/^\?\?/ {c++} END {print c+0}')"

echo "== Git Sync Preflight =="
echo "branch: ${branch}"
echo "tracked files: ${tracked_count}"
echo "working tree entries: ${modified_count}"
echo "untracked entries: ${untracked_count}"
echo

echo "== Remotes =="
if git remote -v | grep -q .; then
  git remote -v
else
  echo "none"
fi
echo

echo "== GitHub Auth =="
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    echo "authenticated"
  else
    echo "not authenticated"
  fi
else
  echo "gh not installed"
fi
echo

echo "== Status Sample =="
git status --short | sed -n '1,40p'
echo

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "WARN: origin is not configured"
fi

if command -v gh >/dev/null 2>&1 && ! gh auth status >/dev/null 2>&1; then
  echo "WARN: gh is not authenticated"
fi

if [ "${untracked_count}" -gt 0 ]; then
  echo "WARN: repository contains untracked files; initial sync scope needs curation"
fi
