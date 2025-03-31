*** Settings ***
Library    SeleniumLibrary
Test Setup    Start Test
Test Teardown    Finish Test

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../steps/login.robot
Resource    ../steps/HomeStep.robot
Resource    ../steps/CartStep.robot
Resource    ../steps/InformationStep.robot

*** Test Cases ***

Cenario 1 - Clicar Continuar comprando
     Dado que tenho um produto adicionado no carrinho
     Quando clicar no carrinho
     E clicar em continue-shopping
     Então vejo a HomePage
Cenario 2 - Clicar e Checkout
    Dado que tenho um produto adicionado no carrinho
    Quando clicar no carrinho
    E clicar em Checkout
    Então vejo a HomePage
Cenario 3 - Finalizar compras
  Dado que tenho um produto adicionado no carrinho de compras
  E clicar em Checkout
  E preencher meus dados
  E Clicar no button continue
  E clicar no button Finish
  Então vejo a mensagem de sucesso 'Thank you for your order!'
