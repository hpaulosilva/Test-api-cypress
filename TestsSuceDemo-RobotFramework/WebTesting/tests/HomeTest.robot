*** Settings ***
Library    SeleniumLibrary
Test Setup    Start Test
Test Teardown    Finish Test

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../steps/login.robot
Resource    ../steps/HomeStep.robot

*** Test Cases ***

Cenario 1 clicar na imagem da mochila
    Dado que estou logado na home
    Quando clicar na imagem da mochila 
    Então vejo a pagina de detalhes
Cenario detalhar produto e voltar para a home
    Dado que estou logado na home 
    Quando clicar na imagem da mochila
    E clicar na Back to products
    Então vejo a HomePage
Cenario 3 - Adicionar item na mochila
    Dado que estou logado na home
    Quando add to cart do produto backpack
    Então o produto é adicionado no carrinho
Cenario 4 - Verificar produto adicionado no carrinho
    Dado que tenho um produto adicionado no carrinho
    Quando clicar no carrinho
    Então vejo o produto adicionado
