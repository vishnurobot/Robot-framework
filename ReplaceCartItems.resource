*** Settings ***
Library                               RequestsLibrary
Library                               JSONLibrary

*** Variables ***






*** Keywords ***
Replace cart item API
    ${req_body}                                          Create Dictionary        productId      3674        json=${prodcut_id}
    ${resp}
    ...  PUT                                             ${url}/carts/${cart_id}/items/${item_Id}
    ...  json=${req_body}
    ...  expected_status=any
    Status Should Be                                     204                                ${resp}