#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "usage: $0 <owner>/<repo>" >&2
  exit 1
fi

repo="$1"

if ! command -v gh >/dev/null 2>&1; then
  echo "gh is not installed" >&2
  exit 1
fi

gh auth status >/dev/null 2>&1 || {
  echo "gh is not authenticated; run 'gh auth login' first" >&2
  exit 1
}

if git remote get-url origin >/dev/null 2>&1; then
  echo "origin already exists:"
  git remote get-url origin
  exit 1
fi

gh repo create "${repo}" --private --source=. --remote=origin

echo "Created private repository and configured origin:"
git remote -v
