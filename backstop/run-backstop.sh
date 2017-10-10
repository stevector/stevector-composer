#!/bin/bash

set -e

# Make artifacts directory
CIRCLE_ARTIFACTS='artifacts'
CIRCLE_ARTIFACTS_DIR='/tmp/artifacts'
mkdir -p $CIRCLE_ARTIFACTS_DIR

# Stash Circle Artifacts URL
CIRCLE_ARTIFACTS_URL="$CIRCLE_BUILD_URL/artifacts/$CIRCLE_NODE_INDEX/$CIRCLE_ARTIFACTS"


# Update the URLs in the backstop file to use the new multidev
CWD=$(pwd)
#sed -i -e "s/dev-${TERMINUS_SITE}/${TERMINUS_ENV}-${TERMINUS_SITE}/g" ${CWD}"/backstop/backstop.json"

backstop reference
VISUAL_REGRESSION_RESULTS=$(backstop test || echo 'true')

rsync -rlvz backstop_data $CIRCLE_ARTIFACTS_DIR

cd $CIRCLE_ARTIFACTS_DIR
DIFF_IMAGE=$(find * -type f -name "failed_diff*.png" | head -n 1)

# Use a diff image if there is one. Otherwise just grab the first image.
if [ -z "$DIFF_IMAGE" ]
then
  IMAGE_TO_LINK=$(find * -type f -name "*.png" | head -n 1)

else
  IMAGE_TO_LINK=$DIFF_IMAGE
fi


diff_image_url=${CIRCLE_ARTIFACTS_URL}/${IMAGE_TO_LINK}
report_url=${CIRCLE_ARTIFACTS_URL}/backstop_data/html_report/index.html
report_link="[![Visual report]($diff_image_url)]($report_url)"
comment="### Visual regression report:"

curl -d '{ "body": "'"$comment\\n\\n$report_link"'" }' -X POST https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN
