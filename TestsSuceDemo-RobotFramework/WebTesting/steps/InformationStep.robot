*** Settings ***
Library    SeleniumLibrary

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/LoginPage.robot
Resource    ../pages/InformationPage.robot


*** Keywords ***
E preencher meus dados
    Preecher meus dados de compra
E Clicar no button continue
    Click Button Continue tela compras
E clicar no button Finish
    Click Button    locator=//button[@data-test='finish']
Então vejo a mensagem de sucesso '${SUCESS_FINAL}'
    Wait Until Element Is Visible    locator=//h2[@class='complete-header'][contains(.,'Thank you for your order!')]
