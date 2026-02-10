*** Settings ***
Library    SeleniumLibrary
Resource   ../common.resource

*** Variables ***
${PRODUCT_TITLE}           class=title
${INVENTORY_LIST}          class=inventory_list
${CART_BADGE}              class=shopping_cart_badge
${CART_LINK}               class=shopping_cart_link

*** Keywords ***
Verify Product Page Loaded
    Wait Until Element Is Visible    ${PRODUCT_TITLE}
    Element Text Should Be    ${PRODUCT_TITLE}    Products

Get Product Count
    ${count}    Get Element Count    class=inventory_item
    RETURN    ${count}

Add Product To Cart
    [Arguments]    ${product_name_locator}
    # Example locator: id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    ${product_name_locator}
    Click Button    ${product_name_locator}

Verify Cart Badge Count
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    ${expected_count}

Click Cart Icon
    Click Link    ${CART_LINK}
