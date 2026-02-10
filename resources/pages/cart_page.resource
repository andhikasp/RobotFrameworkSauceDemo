*** Settings ***
Library    SeleniumLibrary
Resource   ../common.resource

*** Variables ***
${CART_TITLE}              class=title
${CHECKOUT_BUTTON}         id=checkout
${CART_ITEM_NAME}          class=inventory_item_name

*** Keywords ***
Verify Cart Page Loaded
    Wait Until Element Is Visible    ${CART_TITLE}
    Element Text Should Be    ${CART_TITLE}    Your Cart

Verify Product In Cart
    [Arguments]    ${product_name}
    Element Should Be Visible    xpath=//div[@class='inventory_item_name' and text()='${product_name}']

Click Checkout Button
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}
    Click Button    ${CHECKOUT_BUTTON}
