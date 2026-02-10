*** Settings ***
Documentation     Test suite for Logout functionality
Resource          ../resources/common.resource
Resource          ../resources/pages/login_page.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Variables ***
${BURGER_MENU_BUTTON}      id=react-burger-menu-btn
${LOGOUT_LINK}             id=logout_sidebar_link

*** Test Cases ***
Logout Should Redirect To Login Page
    [Documentation]    Verify user can logout successfully
    Login With Credentials    standard_user    secret_sauce
    Wait Until Element Is Visible    ${BURGER_MENU_BUTTON}
    Click Element    ${BURGER_MENU_BUTTON}
    Wait Until Element Is Visible    ${LOGOUT_LINK}    timeout=10s
    Click Link    ${LOGOUT_LINK}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Element Should Be Visible    ${LOGIN_BUTTON}
