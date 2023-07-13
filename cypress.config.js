const { defineConfig } = require('cypress')
//const {submitReport} = require('./cypress/support/oci/authorization')

module.exports = defineConfig({
  e2e: {
    // default baseUrl, etc
    supportFile: false,
    fixturesFolder: false,
    setupNodeEvents(on, config) {
      require('cypress-mochawesome-reporter/plugin')(on)
      const environmentValue = process.env.NODE_ENV || config.env.environmentName || 'homolog'
      const environmentFilename = `./${environmentValue}.settings.json`
      console.log('loading %s', environmentFilename)
      const settings = require(environmentFilename)
      if (settings.baseUrl) {
        config.baseUrl = settings.baseUrl
      }
      if (settings.env) {
        config.env = {
          environmentName: environmentValue,
          ...settings.env,
        }
      }
      console.log('loaded settings for environment %s', environmentValue)
      //on('after:run', async (result) => await submitReport(result))
      return config
    },
  },

  "viewportHeight": 768,
  "viewportWidth": 1266,


  "reporter": "cypress-mochawesome-reporter",
  "reporterOptions": {
    "reportDir": "cypress/reports",
    "charts": true,
    "reportPageTitle": "My Test Suite",
    "embeddedScreenshots": true,
    "inlineAssets": true
  },
  "video": false
})