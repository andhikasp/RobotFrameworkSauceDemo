*** Settings ***
Documentation     Test suite for Checkout functionality
Resource          ../resources/common.resource
Resource          ../resources/pages/login_page.resource
Resource          ../resources/pages/product_page.resource
Resource          ../resources/pages/cart_page.resource
Resource          ../resources/pages/checkout_page.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Successful Checkout Flow
    [Documentation]    Verify successful checkout end-to-end
    Login With Credentials    standard_user    secret_sauce
    Add Product To Cart    id=add-to-cart-sauce-labs-backpack
    Click Cart Icon
    Click Checkout Button
    Verify Checkout Page Loaded
    Input Checkout Information    John    Doe    12345
    Click Continue Button
    Verify Checkout Overview Loaded
    Click Finish Button
    Verify Checkout Complete

Checkout Without Information Should Fail
    [Documentation]    Verify error when proceeding without checkout info
    Login With Credentials    standard_user    secret_sauce
    Add Product To Cart    id=add-to-cart-sauce-labs-backpack
    Click Cart Icon
    Click Checkout Button
    Click Continue Button
    Verify Checkout Error Message    Error: First Name is required
