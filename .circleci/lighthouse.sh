#!/bin/bash

set -ex


PANTHEON_SITE_URL=https://${TERMINUS_ENV}-${TERMINUS_SITE}.pantheonsite.io

# rm -r /tmp/lighthouse-report || echo 'return true even if that dir didn't exist';
mkdir /tmp/lighthouse-report
cd /tmp/lighthouse-report
lighthouse --chrome-flags="--headless --disable-gpu" https://www.stevector.com/ --save-artifacts --save-assets


artifact_base_url="https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/$CIRCLE_BUILD_NUM/artifacts/0$CIRCLE_ARTIFACTS"

                   https://circleci.com/api/v1.1/project/github/stevector/stevector-composer/46/artifacts/0/tmp/lighthouse-report/www.stevector.com_2017-08-31_18-22-35.report.html


curl https://circleci.com/api/v1.1/project/:vcs-type/:username/:project/:build_num/artifacts$CIRCLE_TOKEN | grep -o 'https://[^"]*' > artifacts.txt

https://46-102016661-gh.circle-artifacts.com/0/tmp/lighthouse-report/www.stevector.com_2017-08-31_18-22-35.report.html