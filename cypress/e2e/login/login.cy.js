/// <reference types="cypress" />
import '../../support/commands'
import '../../support/login_commands'
// Bem vindo ao Cypress!
//
// Classe de teste para portifólio onde iremos fazer login na pagina WEB: https://practice.automationtesting.in/my-account/

describe('Suite de testes para funcionalidade de login', () => {
  beforeEach(()=> {
    cy.visitarUrl()
  })

  it('Realização de login com sucesso utilizando environments', () => {
    cy.realizarLogin(Cypress.env('email'), Cypress.env('senha'), 'automation14')
    cy.ValidarMensagemBoasVindas('Hello automation14')
  })
})
