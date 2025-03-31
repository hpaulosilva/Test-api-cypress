*** Settings ***
Library      SeleniumLibrary
Resource     ../config/config.robot

*** Keywords ***

Preecher meus dados de compra
    Input Text    locator=first-name   text=Paulo
    Input Text    locator=last-name    text=Santos
    Input Text    locator=postal-code   text=06436140
    Sleep    3
Click Button Continue tela compras
    Click Element    locator=//input[@value='Continue']

Click Button Cancel
    Click Button    locator=cancel
