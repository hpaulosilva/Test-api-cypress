*** Settings ***
Library    SeleniumLibrary

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/LoginPage.robot


*** Keywords ***
Quando logo com sucess
    Login sucess
Então vejo a HomePage
    Valida HomePage

 Quando informo login com senha incorreta
    Login senha invalida

Então vejo a mensagem de erro '${ERRO_LOGIN}'
    Wait Until Element Is Visible    locator=//*[@id="login_button_container"]/div/form/div[3]/h3
Quando informo login com senha bloqueada
    Login bloqueado
Então vejo a mensagem de erro de bloqueio '${MSG_Bloqueio}'
    Wait Until Element Is Visible    locator=//h3[@data-test='error'][contains(.,'Epic sadface: Sorry, this user has been locked out.')]
    