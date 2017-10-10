'use strict';

module.exports = {
  extends: 'lighthouse:default',
  settings: {
    // skip a11y for now because it's too slow and not in PSI-parity set
    onlyCategories: ['accessibility', 'best-practices', 'performance'],
  },
  categories: {
      "best-practices": {
          weight: 1
      },
      "performance": {
        weight: 1
      },
      "accessibility": {
        weight: 1
      },
  }
};
