*** Settings ***
Library    SeleniumLibrary
Resource   ../common.resource

*** Variables ***
${LOGIN_USERNAME_INPUT}    id=user-name
${LOGIN_PASSWORD_INPUT}    id=password
${LOGIN_BUTTON}            id=login-button
${LOGIN_ERROR_MESSAGE}     css=[data-test="error"]

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    ${LOGIN_USERNAME_INPUT}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Login Error Message
    [Arguments]    ${expected_error}
    Element Text Should Be    ${LOGIN_ERROR_MESSAGE}    ${expected_error}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button
