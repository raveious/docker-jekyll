#!/bin/bash
set -e

#cd /site


if [ ! -f _config.yml ]; then
  git clone -b $TARGET_BRANCH --single-branch --depth 1 --recursive $TARGET_REPO /site
fi

if [ -f Gemfile ]; then
  bundle install
fi

exec "$@"
