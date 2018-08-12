#!/bin/bash
set -e

if [ ! -f _config.yml ] && [ -n "$TARGET_REPO" ]; then
  git clone -b $TARGET_BRANCH --single-branch --depth 1 --recursive $TARGET_REPO /site
fi

if [ -f Gemfile ]; then
  bundle install
fi

exec "$@"
