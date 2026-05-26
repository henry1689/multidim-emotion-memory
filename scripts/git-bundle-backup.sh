#!/usr/bin/env bash
set -euo pipefail

backup_dir="tmp/backups/git-bundles"
mkdir -p "${backup_dir}"

timestamp="$(date +%Y%m%d-%H%M%S)"
bundle_path="${backup_dir}/codex-ops-${timestamp}.bundle"

git bundle create "${bundle_path}" --all

echo "Created bundle backup:"
echo "${bundle_path}"
