#!/usr/bin/env bash

set -e

if [ -f /opt/apps/insta/vendor/bundle/.bundle_finished ]; then
  rm -f /opt/apps/insta/vendor/bundle/.bundle_finished
fi

unset BUNDLE_WITHOUT
bundle config --delete without
bundle install --local --jobs 20 --retry 5 --path vendor/bundle
echo $(date --utc +%FT%T%Z) > /opt/apps/insta/vendor/bundle/.bundle_finished
