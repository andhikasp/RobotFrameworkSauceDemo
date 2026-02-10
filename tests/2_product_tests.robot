*** Settings ***
Documentation     Test suite for Product Page functionality
Resource          ../resources/common.resource
Resource          ../resources/pages/login_page.resource
Resource          ../resources/pages/product_page.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Product Page Should Be Accessible After Login
    [Documentation]    Verify product page loads after login
    Login With Credentials    standard_user    secret_sauce
    Verify Product Page Loaded

Product List Should Not Be Empty
    [Documentation]    Verify that products are displayed
    Login With Credentials    standard_user    secret_sauce
    ${count}    Get Product Count
    Should Be True    ${count} > 0
