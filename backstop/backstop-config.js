'use strict';

// Use live site for comparison base:
const BackstopReferenceBaseUrl = process.env.PANTHEON_DEV_SITE_URL;
const BackstopTestUrl = process.env.PANTHEON_SITE_URL;

const simple_scenarios_paths = [
    // @todo, get at least one path for each node type
    // and any other important pages.

   // "2013/08/fixing-typos-with-jekyll-and-github/",
    "2013/06/plugin-haikus-drupalcon-portland-presentation/",
    // "2013/06/another-jekyll-blog/",
    "2016/09/drupal-7-to-8-migration-diary-part-4-migrating-remote-files-and-swapping-a-service-class/",
    "2016/06/drupal-7-to-8-migration-diary-part-3-regression-found/",
    "2016/06/drupal-7-to-8-migration-diary-part-2-using-configuration-installer-to-delay-a-canonical-database/",
    "2016/06/drupal-7-to-drupal-8-migration-diary-part-1-what-have-i-gotten-myself-into/",
    "2016/05/the-year-gone-by-the-months-ahead/",
    "2015/06/drupalcon-la-html/",
    "2014/01/i-graphed-my-skyrocketing-exclamation-point-usage/",
    "2013/10/make-your-drupal-8-theme-easier-to-maintain-with-this-one-weird-trick-twigs-extends-concept/"
];

const config = {
    "id": "backstop_default",
    "viewports": [
        {
            "label": "desktop",
            "width": 1440,
            "height": 900
        },
        {
            "label": "phone",
            "width": 320,
            "height": 480
        }
    ],
    "scenarios": [
        {
            "label": "Homepage",
            "url": BackstopTestUrl + "/",
            "referenceUrl": BackstopReferenceBaseUrl + "",
            "hideSelectors": ["#comments"],
            "removeSelectors": ["#comments"],
            "selectors": [
                "document"
            ],
            "readyEvent": null,
            "delay": 500,
            "misMatchThreshold" : 0.5
        }
    ],
    "paths": {
        "bitmaps_reference": "backstop_data/bitmaps_reference",
        "bitmaps_test": "backstop_data/bitmaps_test",
        "engine_scripts": "backstop_data/engine_scripts",
        "html_report": "backstop_data/html_report",
        "ci_report": "backstop_data/ci_report"
    },
    "report": ["browser"],
    "engine": "chrome",
    // Add a lower limit on comparisons (default was 50) that keeps CircleCI from
    // running out of memory on a 2GB instance.
    "asyncCompareLimit": 5,
    // "asyncCaptureLimit": 1
};


const simple_scenarios = simple_scenarios_paths.map(function(path) {

    return {
        "url": BackstopTestUrl + path,
        "referenceUrl":BackstopReferenceBaseUrl +  path,
        "label": path,
        "delay": 500
    }
});

config.scenarios = config.scenarios.concat(simple_scenarios);

module.exports = config;
