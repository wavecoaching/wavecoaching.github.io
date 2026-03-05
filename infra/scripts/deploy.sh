#!/usr/bin/env bash
set -e

# ------------------------------------------------------------
# deploy.sh — Wave Coaching Site manual deploy helper
#
# Usage: ./infra/scripts/deploy.sh
#
# Requires: gh (GitHub CLI) — https://cli.github.com/
# ------------------------------------------------------------

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
WORKFLOW="deploy.yml"
BRANCH="main"

cd "$REPO_ROOT"

# Verify we're on the main branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
  echo "Error: You must be on the '$BRANCH' branch to deploy (currently on '$CURRENT_BRANCH')."
  exit 1
fi

# Verify working tree is clean
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "Error: You have uncommitted changes. Commit or stash them before deploying."
  exit 1
fi

# Run a local build to validate everything compiles
echo "Running local build check..."
npm ci --silent
npm run build

echo "Build succeeded. Triggering GitHub Actions deploy..."

# Trigger the workflow via GitHub CLI
gh workflow run "$WORKFLOW" --ref "$BRANCH"

echo ""
echo "Deploy triggered. Track progress at:"
echo "  https://github.com/wavecoaching/wavecoaching.github.io/actions"
echo ""
echo "Site will be live at: https://wavecoaching.github.io"
