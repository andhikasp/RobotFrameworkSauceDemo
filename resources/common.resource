*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
${HEADLESS}   False

*** Keywords ***
Open Application
    ${options}=    Set Variable    add_argument("--incognito")
    IF    ${HEADLESS}
        ${options}=    Catenate    SEPARATOR=;    ${options}    add_argument("--headless")
    END
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    Register Keyword To Run On Failure    Capture Screenshot On Failure

Capture Screenshot On Failure
    ${test_name_formatted}=    Replace String    ${TEST NAME}    ${SPACE}    _
    Capture Page Screenshot    filename=${test_name_formatted}_screenshot.png

Close Application
    Close Browser
