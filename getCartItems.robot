*** Settings ***
Library                                       RequestsLibrary

*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

*** Keywords ***
Get cart items API
     ${resp}                                             GET                             ${url}/carts/${cart_id}/items         expected_status=200
#     ${response_item}                                   Evaluate                       str(${resp.json()})
     ${response_item}                                    Set Variable                    ${resp.json()}
    Status Should Be                                     200                             ${resp}
    RETURN                                               ${response_item[0]}[productId]      ${response_item[0]}[quantity]
#    Log To Console                                                                       ${response_item[0]}[productId]
#    Log To Console                                                                       ${response_item[0]}[quantity]