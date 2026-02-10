*** Settings ***
Documentation     Test suite for Cart functionality
Resource          ../resources/common.resource
Resource          ../resources/pages/login_page.resource
Resource          ../resources/pages/product_page.resource
Resource          ../resources/pages/cart_page.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Add Single Product To Cart
    [Documentation]    Verify adding a single product to cart
    Login With Credentials    standard_user    secret_sauce
    Add Product To Cart    id=add-to-cart-sauce-labs-backpack
    Verify Cart Badge Count    1
    Click Cart Icon
    Verify Cart Page Loaded
    Verify Product In Cart    Sauce Labs Backpack

Add Multiple Products To Cart
    [Documentation]    Verify adding multiple products to cart
    Login With Credentials    standard_user    secret_sauce
    Add Product To Cart    id=add-to-cart-sauce-labs-backpack
    Add Product To Cart    id=add-to-cart-sauce-labs-bike-light
    Verify Cart Badge Count    2
    Click Cart Icon
    Verify Cart Page Loaded
    Verify Product In Cart    Sauce Labs Backpack
    Verify Product In Cart    Sauce Labs Bike Light
