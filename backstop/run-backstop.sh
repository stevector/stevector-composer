#!/bin/bash

set -ex

# Make artifacts directory
CIRCLE_ARTIFACTS='artifacts'
CIRCLE_ARTIFACTS_DIR='/tmp/artifacts'
mkdir -p $CIRCLE_ARTIFACTS_DIR

# Stash Circle Artifacts URL
CIRCLE_ARTIFACTS_URL="$CIRCLE_BUILD_URL/artifacts/$CIRCLE_NODE_INDEX/$CIRCLE_ARTIFACTS"


# Update the URLs in the backstop file to use the new multidev
CWD=$(pwd)
#sed -i -e "s/dev-${TERMINUS_SITE}/${TERMINUS_ENV}-${TERMINUS_SITE}/g" ${CWD}"/backstop/backstop.json"

cat /home/chrome/example_wordpress_composer/backstop.json

pwd


ls -al

backstop reference
VISUAL_REGRESSION_RESULTS=$(backstop test || echo 'true')

rsync -rlvz backstop_data $CIRCLE_ARTIFACTS_DIR

cd $CIRCLE_ARTIFACTS_DIR
diff_image=$(find * | grep png | grep diff | head -n 1)
diff_image_url=${CIRCLE_ARTIFACTS_URL}/$diff_image
report_url=${CIRCLE_ARTIFACTS_URL}/backstop_data/html_report/index.html
report_link="[![Visual report]($diff_image_url)]($report_url)"
comment="### Visual regression report:"

# curl -d '{ "body": "'"$comment\\n\\n$report_link"'" }' -X POST https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN
