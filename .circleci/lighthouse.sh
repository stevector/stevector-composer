#!/bin/bash

set -ex

PANTHEON_SITE_URL=https://${TERMINUS_ENV}-${TERMINUS_SITE}.pantheonsite.io

# Make artifacts directory
CIRCLE_ARTIFACTS='artifacts'
CIRCLE_ARTIFACTS_DIR='/tmp/artifacts'
mkdir -p $CIRCLE_ARTIFACTS_DIR


# Stash Circle Artifacts URL
CIRCLE_ARTIFACTS_URL="$CIRCLE_BUILD_URL/artifacts/$CIRCLE_NODE_INDEX/$CIRCLE_ARTIFACTS"

cd $CIRCLE_ARTIFACTS_DIR
lighthouse --chrome-flags="--headless --disable-gpu" ${PANTHEON_SITE_URL} --save-artifacts --save-assets --perf

HTML_REPORT=$(find ./backstop_data -type f -name "*.html" | head -n 1)


$REPORT_URL=${CIRLCLE_ARTIFACTS_URL}/${HTML_REPORT}


echo $CIRCLE_ARTIFACTS

echo $ARTIFACT_URL

echo $CIRCLE_ARTIFACTS_URL
echo $HTML_REPORT


COMMENT="### Lighthouse report: \n ${ARTIFACT_URL}"

curl -d '{ "body": "'"$COMMENT"'" }' -X POST https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN
