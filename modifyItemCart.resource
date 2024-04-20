*** Settings ***
Library                                            RequestsLibrary
Library                                            JSONLibrary
*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

${midifyed_quantity}                               4


*** Keywords ***

Modify an item in the cart
    [Arguments]                                          ${quantity}=4
    ${req_body}                                          Create Dictionary               quantity=${quantity}
    ${resp}
    ...  PATCH                                           ${url}/carts/${cart_id}/items/${item_Id}
    ...  json=${req_body}
    ...  expected_status=any

    Status Should Be                                     204                             ${resp}
