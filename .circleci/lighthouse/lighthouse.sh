#!/bin/bash

set -ex

LIGHTHOUSE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LIGHTHOUSE_SCRIPTS_DIR=${LIGHTHOUSE_DIR}/frontend

cd $CIRCLE_ARTIFACTS_DIR
lighthouse --chrome-flags="--headless --disable-gpu" ${PANTHEON_SITE_URL} --save-artifacts --save-assets --config-path=${LIGHTHOUSE_SCRIPTS_DIR}/no_pwa.js --output=json --output=html


HTML_REPORT=$(find * -type f -name "*report.html" | head -n 1)
REPORT_URL="${CIRCLE_ARTIFACTS_URL}/${HTML_REPORT}"

JSON_REPORT=$(find * -type f -name "*report.json" | head -n 1)
node ${LIGHTHOUSE_SCRIPTS_DIR}/pass_fail_pr.js --resultspath=$CIRCLE_ARTIFACTS_DIR/$JSON_REPORT  --reporturl=$REPORT_URL


