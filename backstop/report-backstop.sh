#!/bin/bash

CIRCLE_ARTIFACTS_URL=${CIRCLE_BUILD_URL}/artifacts/$CIRCLE_NODE_INDEX/artifact
cd '/tmp/artifacts'

IMAGE=$(find * -type f -name "*desktop.png" | head -n 1)
REPORT_URL=${CIRCLE_ARTIFACTS_URL}/backstop_data/html_report/index.html
BODY="### Visual regression report:\\n\\n[![Visual report](${CIRCLE_ARTIFACTS_URL}/${IMAGE})]($REPORT_URL)"
echo $BODY

{
  GITHUB_URL=https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN
  curl -d '{ "body": "'"$BODY"'" }' -X POST $GITHUB_URL
} &> /dev/null
