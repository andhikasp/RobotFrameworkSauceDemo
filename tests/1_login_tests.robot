*** Settings ***
Documentation     Test suite for Login functionality
Resource          ../resources/common.resource
Resource          ../resources/pages/login_page.resource
Resource          ../resources/pages/product_page.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Login With Valid Credentials Should Succeed
    [Documentation]    Test login with valid username and password
    Login With Credentials    standard_user    secret_sauce
    Verify Product Page Loaded

Login With Invalid Credentials Should Fail
    [Documentation]    Test login with invalid password
    Login With Credentials    standard_user    invalid_password
    Verify Login Error Message    Epic sadface: Username and password do not match any user in this service

Login With Locked Out User Should Fail
    [Documentation]    Test login with locked out user
    Login With Credentials    locked_out_user    secret_sauce
    Verify Login Error Message    Epic sadface: Sorry, this user has been locked out.
