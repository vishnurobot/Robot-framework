*** Settings ***
Library                                       RequestsLibrary

*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

*** Keywords ***
ADD a item to cart
    Log                                   cartId: ${cart_id}
    ${req_body}                              Create Dictionary           productId      4641
    ${resp}                                  post                            ${url}/carts/${cart_id}/items    json=${req_body}          expected_status=any
    Status Should Be                         201                             ${resp}
#    ${itemId}=                               Evaluate                         str(${resp.json()}[itemId])
    ${itemId}                               Set Variable                         ${resp.json()}[itemId]
    Set Test Variable                                    ${item_Id}           ${itemId}