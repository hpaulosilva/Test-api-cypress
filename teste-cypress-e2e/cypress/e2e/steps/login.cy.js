describe('Realizar login com sucesso', () => {
    it('Usuario deve realizar login com sucesso', () => {
        cy.visit('https://www.saucedemo.com/');
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();
    });
    it('login invalido', () => {
        cy.visit('https://www.saucedemo.com/');
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('172635jjj');
        cy.get('#login-button').click();
        cy.contains('Epic sadface: Username and password do not match any user in this service').should('be.visible');
    });
  });