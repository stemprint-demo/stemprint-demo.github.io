#!/usr/bin/env sh
set -eu

MESSAGE="${1:-Update demo page}"
REMOTE="${DEPLOY_REMOTE:-pages}"
BRANCH="${DEPLOY_BRANCH:-main}"

git add -A

if git diff --cached --quiet; then
  echo "Nothing to deploy."
  exit 0
fi

git commit -m "$MESSAGE"
git push "$REMOTE" "$BRANCH"

