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

    it('Criar um novo usuário com email já existente', () => {

        cy.request({
            method: 'POST',
            url: '/usuarios',
            failOnStatusCode: false,  // --> usado para validar cenarios de falha.
            body: {
                    nome: "Fulano da Silva",
                    email: "beltrano@qa.com.br",
                    password: "teste",
                    administrador: "true"
                }
        }).then((response) => {
            expect(response.status).to.eq(400)
            expect(response.body.message).to.eq("Este email já está sendo usado")
            cy.log(response.body)
           
        })
    })

    it('Criar um novo usuário com o campo de nome vazio', () => {

        cy.request({
            method: 'POST',
            url: '/usuarios',
            failOnStatusCode: false, 
            body: {
                    nome: "",
                    email: "beltrano@qa.com.br",
                    password: "teste",
                    administrador: "true"
                }
        }).then((response) => {
            expect(response.status).to.eq(400)
            expect(response.body.nome).to.eq("nome não pode ficar em branco")
            cy.log(response.body)
           
        })
    })
    it('Criar um novo usuário com a senha vazia', () => {

        cy.request({
            method: 'POST',
            url: '/usuarios',
            failOnStatusCode: false,
            body: {
                    nome: "Fulano da Silva",
                    email: "beltrano@qa.com.br",
                    password: "",
                    administrador: "true"
                }
        }).then((response) => {
            expect(response.status).to.eq(400)
            expect(response.body.password).to.eq("password não pode ficar em branco")
            cy.log(response.body)
           
        })
    })

    it('Criar um novo usuário com o body vazio', () => {

        cy.request({
            method: 'POST',
            url: '/usuarios',
            failOnStatusCode: false,
            body: {
                
                }
        }).then((response) => {
            expect(response.status).to.eq(400)
            cy.log(response.body)
           
        })
    })




})
