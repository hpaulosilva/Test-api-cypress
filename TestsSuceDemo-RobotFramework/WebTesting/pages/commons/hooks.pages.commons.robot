*** Settings ***

Resource    ../../config/config.robot

Library    SeleniumLibrary   

*** Keywords ***

Start Test
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    #Set Window Size    ${BROWSER_CUSTOMER_WIDTH}    ${BROWSER_CUSTOMER_HEIGHT}
    Set Selenium Implicit Wait    ${TIME_TO_WAIT}

Finish Test
    Capture Page Screenshot
    Close Browser

