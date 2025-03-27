import { faker } from '@faker-js/faker'

describe('Teste API Rest', () => {
    let usedId;
    const nome = faker.person.fullName();
    const email = faker.internet.email(nome).toLowerCase();


    it('Restornar lista de usuarios', () => {
        cy.request({
            method: 'GET',
            url: '/usuarios'
        }).then((response) => {
            expect(response.status).to.eq(200)
        })
    })

    it('Criar um novo usuário', () => {

        cy.request({
            method: 'POST',
            url: '/usuarios',
            body: {
                    nome: "Paulo Santos",
                    email: email,
                    password: "teste123",
                    administrador:"true"
                  }
        }).then((response) => {
            expect(response.status).to.eq(201)
            expect(response.body).to.have.property('_id');

            usedId = response.body._id;
            cy.log("ID User: ${usedId}")
            cy.log(response.body)
            cy.log(response.body.message)
        })
    })

    it('Alterar usuário', () => {

        cy.request({
            method: 'PUT',
            url: `/usuarios/${usedId}`,
            body: {
                    nome: "Paulo Santos",
                    email: email,
                    password: "teste123",
                    administrador:"true"
                  }
        }).then((response) => {
            expect(response.status).to.eq(200)
          
            cy.log(usedId)
            cy.log(response.body)
            cy.log(response.body.message)
            
        })
    })

    it('Excluir o usuário', () => {
        cy.request({
            method: 'DELETE',
            url: `/usuarios/${usedId}`, // Usa o mesmo ID do usuário criado
            headers: {
                accept: 'application/json'
            }
        }).then((response) => {
            expect(response.status).to.eq(200)
           
            usedId = response.body._id;
            cy.log(`Usuário com ID ${usedId} excluído`)
            ;
            cy.log(response.body);
        })
    })

})
