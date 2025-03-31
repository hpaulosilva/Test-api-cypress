import { faker } from '@faker-js/faker';


describe('Realizar realizar uma compra', () => {
    it('Eu como usuario deve realizar e finalizar uma compra com sucesso', () => {
        const nome= faker.person.fullName();
        const sobrenome = faker.person.lastName();
        const cep = faker.location.zipCode('#####-###')

        cy.visit('https://www.saucedemo.com/');
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();
        cy.wait(2000);

        // Adicionar produto ao carrinho
        cy.get('#add-to-cart-sauce-labs-backpack').click();
        cy.get('#shopping_cart_container').click();
        cy.get('#checkout').click();

        // Preencher informações de entrega e finalizar compra
        cy.get('#first-name').type(nome);
        cy.get('#last-name').type(nome);
        cy.get('#postal-code').type(cep);
        cy.get('#continue').click();
        cy.get('#finish').click();

        //validar se a compra foi realizada com sucesso
        cy.contains('Thank you for your order!').should('be.visible');

    });
  });