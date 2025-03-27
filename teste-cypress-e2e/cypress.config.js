const { defineConfig } = require('cypress');
const createEsbuildPlugin = require('@badeball/cypress-cucumber-preprocessor/esbuild').createEsbuildPlugin;

module.exports = defineConfig({
  e2e: {
    specPattern: "cypress/e2e/**/*.feature", // Define os arquivos .feature
    setupNodeEvents(on, config) {
      require('@badeball/cypress-cucumber-preprocessor').addCucumberPreprocessorPlugin(on, config);
      on("file:preprocessor", createEsbuildPlugin(config));
      return config;
    },
  },
});