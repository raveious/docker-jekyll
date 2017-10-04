#!/bin/bash
set -e

#cd /site

TARGET_BRANCH=${TARGET_BRANCH="master"}

if [ ! -f _config.yml ] && [ -n "$TARGET_REPO" ]; then
  git clone -b $TARGET_BRANCH --single-branch --depth 1 --recursive $TARGET_REPO /site
fi

if [ -f Gemfile ]; then
  bundle install
fi

exec "$@"
