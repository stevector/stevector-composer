#!/bin/bash

set -ex


PANTHEON_SITE_URL=https://${TERMINUS_ENV}-${TERMINUS_SITE}.pantheonsite.io

# rm -r /tmp/lighthouse-report || echo 'return true even if that dir didn't exist';
mkdir /tmp/lighthouse-report
cd /tmp/lighthouse-report
lighthouse --chrome-flags="--headless --disable-gpu" https://www.stevector.com/ --save-artifacts --save-assets


artifact_base_url="https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/$CIRCLE_BUILD_NUM/artifacts/0$CIRCLE_ARTIFACTS"

ARTIFACT_URL="https://circleci.com/api/v1.1/project/github/stevector/stevector-composer/${CIRCLE_BUILD_NUM}/artifacts"

comment="### Lighthouse report:"

