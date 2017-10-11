/**
 * Copyright 2017 Google Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

const LighthouseCI = require('./node_modules/lighthouse-ci/frontend/lighthouse-ci.js');
const ResultPath = process.argv.slice(2);
const lhResults = require('' + process.argv.slice(2));

const CI = new LighthouseCI(process.env.GITHUB_TOKEN);

const prInfo = {
    repo: process.env.CIRCLE_PROJECT_REPONAME,
    owner: process.env.CIRCLE_PROJECT_USERNAME,
    number: process.env.PR_NUMBER,
    sha: process.env.CIRCLE_SHA1,
    minPassScore: '90'
};

try {
    CI.postLighthouseComment(prInfo, lhResults);
    CI.assignPassFailToPR(lhResults, prInfo, prInfo);
} catch (err) {
    CI.handleError(err, prInfo);
}

