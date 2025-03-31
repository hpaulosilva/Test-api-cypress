*** Settings ***
Library      SeleniumLibrary
Resource     ../config/config.robot

*** Keywords ***
Click Button Remove
    Click Button    locator=//button[contains(.,'Remove')]
Click Button Continue
    Click Button    locator=//button[contains(@name,'continue-shopping')]
Click Button Checkout
    Click Button    locator=checkout
    
