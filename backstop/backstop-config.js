
const BackstopReferenceBaseUrl = process.env.PANTHEON_DEV_SITE_URL;
const BackstopTestUrl = process.env.PANTHEON_SITE_URL;
const OutputBasePath = process.env.CIRCLE_ARTIFACTS_DIR;

const config = {
  "id": "backstop_default",
  "viewports": [
    {
      "label": "phone",
      "width": 320,
      "height": 480
    },
    {
      "label": "tablet",
      "width": 1024,
      "height": 768
    }
  ],
  "onBeforeScript": "chromy/onBefore.js",
  "onReadyScript": "chromy/onReady.js",
  "scenarios": [
    {
      "label": "Homepage",
      "url": BackstopTestUrl,
      "referenceUrl": BackstopReferenceBaseUrl,
      "readyEvent": "",
      "readySelector": "",
      "delay": 0,
      "hideSelectors": [],
      "removeSelectors": [],
      "clickSelector": "",
      "postInteractionWait": "",
      "selectors": [],
      "selectorExpansion": true,
      "misMatchThreshold" : 0.1,
      "requireSameDimensions": true
    }
  ],
  "paths": {
    "bitmaps_reference": OutputBasePath + "/backstop_data/bitmaps_reference",
    "bitmaps_test": OutputBasePath + "/backstop_data/bitmaps_test",
    "engine_scripts": OutputBasePath + "/backstop_data/engine_scripts",
    "html_report": OutputBasePath + "/backstop_data/html_report",
    "ci_report": OutputBasePath + "/backstop_data/ci_report"
  },
  "report": ["browser"],
  "engine": "chrome",
  "engineFlags": [],
  "debug": false,
  "debugWindow": false
}

module.exports = config;
