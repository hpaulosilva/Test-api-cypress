*** Settings ***
Library    SeleniumLibrary

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/LoginPage.robot
Resource    ../pages/CartPage.robot


*** Keywords ***
Dado que tenho um produto adicionado no carrinho de compras
    Login sucess
    Button Add to Cart Backpack
    Clicar carrinho
E clicar em continue-shopping
    Click Button Continue
E clicar em Checkout
    Click Button Checkout