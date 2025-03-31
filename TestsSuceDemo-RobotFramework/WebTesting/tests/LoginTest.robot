*** Settings ***
Library    SeleniumLibrary
Test Setup    Start Test
Test Teardown    Finish Test

Resource    ../pages/commons/hooks.pages.commons.robot
Resource    ../pages/HomePage.robot
Resource    ../steps/login.robot


*** Test Cases ***
Caso de teste Login com senha invalida
    Quando informo login com senha incorreta
    Então vejo a mensagem de erro 'Epic sadface: Username and password do not match any user in this service'

Caso de teste login com sucesso
    Quando logo com sucess
    Então vejo a HomePage

Caso de teste Login bloqueado
    Quando informo login com senha bloqueada
    Então vejo a mensagem de erro de bloqueio 'Epic sadface: Sorry, this user has been locked out.'
    