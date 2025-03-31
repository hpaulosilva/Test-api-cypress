*** Settings ***
Library      SeleniumLibrary
Resource     ../config/config.robot

*** Keywords ***

Clicar no menu lateral
    Click Element    locator=react-burger-menu-btn
Click in All Items
    Click Element    locator=inventory_sidebar_link
Click en About
    Click Element    locator=about_sidebar_link
Click in Logout
    Click Element    locator=logout_sidebar_link
Click in reset_sidebar_link
    Click Element    locator=$reset_sidebar_link

Valida HomePage
    Wait Until Element Is Visible    locator=//*[@id="header_container"]/div[1]/div[2]/div

Click in image Sauce Labs Backpack
    Click Image    locator=//img[contains(@alt,'Sauce Labs Backpack')]
Click in image Sauce Labs Bike Light
    Click Image    locator=//img[@alt='Sauce Labs Bike Light']
Click in image Sauce Labs Bolt T-Shirt
    Click Image    locator=//img[@alt='Sauce Labs Bolt T-Shirt']
Click in Back to products
    Click Element    locator=//button[contains(.,'Back to products')]
Button Add to Cart Backpack
    Click Element    locator=//button[@data-test='add-to-cart-sauce-labs-backpack']
Clicar carrinho
    Click Element    locator=shopping_cart_container
Valida produto no carrinho
    Click Element    locator=item_4_title_link