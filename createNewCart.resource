*** Settings ***
Library                                       RequestsLibrary

*** Variables ***
${url}                                             http://simple-grocery-store-api.online/
*** Keywords ***
Create new a cart
    ${resp}                                              post                            ${url}/carts                        expected_status=201
    Status Should Be                                     201                             ${resp}
    Should Be True                                                                       ${resp.json()}[created]
    ${cartid}                                            Set Variable                    ${resp.json()}[cartId]
    Set Global Variable                                  ${cart_id}                      ${cartid}
    Log To Console                                                                cartid=${cart_id}
    Log Variables

#    ${cartId}             Get Value From Json                                ${resp.json()}                               $.cartId
#    Set Global Variable                                  ${cartId}