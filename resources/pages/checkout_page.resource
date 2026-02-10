*** Settings ***
Library    SeleniumLibrary
Resource   ../common.resource

*** Variables ***
${CHECKOUT_TITLE}          class=title
${FIRST_NAME_INPUT}        id=first-name
${LAST_NAME_INPUT}         id=last-name
${POSTAL_CODE_INPUT}       id=postal-code
${CONTINUE_BUTTON}         id=continue
${FINISH_BUTTON}           id=finish
${CHECKOUT_COMPLETE_HEADER}    class=complete-header
${ERROR_MESSAGE}           css=[data-test="error"]

*** Keywords ***
Verify Checkout Page Loaded
    Wait Until Element Is Visible    ${CHECKOUT_TITLE}
    Element Text Should Be    ${CHECKOUT_TITLE}    Checkout: Your Information

Input Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}
    Input Text    ${POSTAL_CODE_INPUT}    ${postal_code}

Click Continue Button
    Click Button    ${CONTINUE_BUTTON}

Verify Checkout Overview Loaded
    Wait Until Element Is Visible    ${CHECKOUT_TITLE}
    Element Text Should Be    ${CHECKOUT_TITLE}    Checkout: Overview

Click Finish Button
    Click Button    ${FINISH_BUTTON}

Verify Checkout Complete
    Wait Until Element Is Visible    ${CHECKOUT_COMPLETE_HEADER}
    Element Text Should Be    ${CHECKOUT_COMPLETE_HEADER}    Thank you for your order!

Verify Checkout Error Message
    [Arguments]    ${expected_error}
    Element Text Should Be    ${ERROR_MESSAGE}    ${expected_error}
