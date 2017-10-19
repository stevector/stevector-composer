#!/bin/bash

set -ex

#=====================================================================================================================
# Start EXPORTing needed environment variables
# Circle CI 2.0 does not yet expand environment variables so they have to be manually EXPORTed
# Once environment variables can be expanded this section can be removed
# See: https://discuss.circleci.com/t/unclear-how-to-work-with-user-variables-circleci-provided-env-variables/12810/11
# See: https://discuss.circleci.com/t/environment-variable-expansion-in-working-directory/11322
# See: https://discuss.circleci.com/t/circle-2-0-global-environment-variables/8681
#=====================================================================================================================


echo 'export BRANCH=$(echo $CIRCLE_BRANCH | grep -v '"'"'^\(master\|[0-9]\+.x\)$'"'"')' >> $BASH_ENV
echo 'export PR_ENV=${BRANCH:+pr-$BRANCH}' >> $BASH_ENV
echo 'export CIRCLE_ENV=ci-$CIRCLE_BUILD_NUM' >> $BASH_ENV
# If we are on a pull request


echo ${CIRCLE_PULL_REQUEST}


if [[ ${CIRCLE_BRANCH} != "master" && ! -z ${CIRCLE_PULL_REQUEST} ]]
then
echo 'pr exists'

	# Then use a pr- branch/multidev
	PR_NUMBER=${CIRCLE_PULL_REQUEST##*/}
	PR_BRANCH="pr-${PR_NUMBER}"
	echo "export DEFAULT_ENV=pr-${PR_NUMBER}" >> $BASH_ENV
else
	# otherwise make the branch name multidev friendly
	if [[ $CIRCLE_BRANCH == "master" ]]
	then
		echo "export DEFAULT_ENV=dev" >> $BASH_ENV
	else
		echo 'export DEFAULT_ENV=$(echo ${PR_ENV:-$CIRCLE_ENV} | tr '"'"'[:upper:]'"'"' '"'"'[:lower:]'"'"' | sed '"'"'s/[^0-9a-z-]//g'"'"' | cut -c -11 | sed '"'"'s/-$//'"'"')' >> $BASH_ENV
	fi
fi

# Make artifacts directory
CIRCLE_ARTIFACTS_DIR='/tmp/artifacts'
mkdir -p $CIRCLE_ARTIFACTS_DIR

echo 'export PANTHEON_DEV_SITE_URL=https://dev-${TERMINUS_SITE}.pantheonsite.io' >> $BASH_ENV
echo 'export PANTHEON_SITE_URL=https://${TERMINUS_ENV}-${TERMINUS_SITE}.pantheonsite.io' >> $BASH_ENV
echo 'CIRCLE_ARTIFACTS_DIR="/tmp/artifacts"' >> $BASH_ENV
echo 'export CIRCLE_ARTIFACTS_URL=${CIRCLE_BUILD_URL}/artifacts/$CIRCLE_NODE_INDEX/artifacts' >> $BASH_ENV
echo 'export PR_NUMBER=${CIRCLE_PULL_REQUEST##*/}' >> $BASH_ENV
echo 'export TERMINUS_ENV=${TERMINUS_ENV:-$DEFAULT_ENV}' >> $BASH_ENV
source $BASH_ENV
