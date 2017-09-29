#!/bin/bash

set -ex

PANTHEON_SITE_URL=https://${TERMINUS_ENV}-${TERMINUS_SITE}.pantheonsite.io

mkdir /tmp/lighthouse-report
cd /tmp/lighthouse-report
lighthouse --chrome-flags="--headless --disable-gpu" ${PANTHEON_SITE_URL} --save-artifacts --save-assets --perf

ARTIFACT_URL="https://circleci.com/api/v1.1/project/github/stevector/stevector-composer/${CIRCLE_BUILD_NUM}/artifacts"


echo $CIRCLE_ARTIFACTS

echo $ARTIFACT_URL

#comment="### Lighthouse report: \n ${ARTIFACT_URL}"

#curl -d '{ "body": "'"$comment"'" }' -X POST https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN