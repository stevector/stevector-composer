#!/bin/bash

set -ex

LIGHTHOUSE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LIGHTHOUSE_SCRIPTS_DIR=${LIGHTHOUSE_DIR}/node_modules/lighthouse-ci/frontend

cd $CIRCLE_ARTIFACTS_DIR
lighthouse --chrome-flags="--headless --disable-gpu" ${PANTHEON_SITE_URL} --save-artifacts --save-assets --config-path=${LIGHTHOUSE_SCRIPTS_DIR}/no_pwa.js --output=json --output=html


HTML_REPORT=$(find * -type f -name "*report.html" | head -n 1)
REPORT_URL="${CIRCLE_ARTIFACTS_URL}/${HTML_REPORT}"
COMMENT="### Lighthouse report: \n ${REPORT_URL}"



JSON_REPORT=$(find * -type f -name "*report.json" | head -n 1)
node ${LIGHTHOUSE_SCRIPTS_DIR}/pass_fail_pr.js $CIRCLE_ARTIFACTS_DIR/$JSON_REPORT


{
curl -d '{ "body": "'"$COMMENT"'" }' -X POST https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN
} &> /dev/null


