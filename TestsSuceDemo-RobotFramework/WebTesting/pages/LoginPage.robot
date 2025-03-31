*** Settings ***
Library      SeleniumLibrary
Resource     ../config/config.robot

*** Keywords ***
Login sucess
    Input Text    locator=user-name    text=standard_user
    Input Password    locator=password    password=secret_sauce
    Click Button    locator=login-button

Login senha invalida
    Input Text    locator=user-name    text=standard_user
    Input Password    locator=password    password=123456
    Click Button    locator=login-button
Login bloqueado
    Input Text    locator=user-name    text=locked_out_user
    Input Password    locator=password    password=secret_sauce
    Click Button    locator=login-button