const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    specPattern: "cypress/e2e/**/*.cy.{js,ts}", // Define os arquivos de teste padrão do Cypress
    setupNodeEvents(on, config) {
      // Removemos qualquer configuração relacionada ao Cucumber
      return config;
    },
  },
});