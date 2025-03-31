*** Settings ***
Library    SeleniumLibrary

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/LoginPage.robot


*** Keywords ***
Dado que estou logado na home 
    Login sucess
    Valida HomePage
Quando clicar na imagem da mochila 
    Click in image Sauce Labs Backpack
Então vejo a pagina de detalhes
    Wait Until Element Is Visible    locator=//div[contains(@class,'inventory_details_desc large_size')]

E clicar na Back to products
    Click in Back to products
Quando add to cart do produto backpack
    Button Add to Cart Backpack
Então o produto é adicionado no carrinho
    Wait Until Element Is Visible    locator=//span[@class='shopping_cart_badge'][contains(.,'1')]
 Dado que tenho um produto adicionado no carrinho
    Dado que estou logado na home
    Quando add to cart do produto backpack
Quando clicar no carrinho
    Clicar carrinho
Então vejo o produto adicionado
    Valida produto no carrinho
