*** Settings ***
Library                         RequestsLibrary
Library                         JSONLibrary

*** Variables ***
${url}                                             http://simple-grocery-store-api.online/
${prodcut_id}                                      1225
${midifyed_quantity}                               4
${cart_id}



*** Keywords ***
Create a new order

    ${json}
    ...    Load Json From File
    ...    apiTesting/templates/create_a_order.json
    ${json}
    ...     Update Value To Json
    ...    ${json}
    ...    $.cartId
    ...    ${cart_id}
    Log To Console    ${json}
    ${json}
    ...     Update Value To Json
    ...     ${json}
    ...     $.customerName
    ...     praveen ayyar
    Log To Console    ${json}
    ${Authorization}                                    Create Dictionary        Authorization=Bearer ${barear_token}
    ${res}                                              POST                     ${url}/orders                 headers=${Authorization}       json=${json}    expected_status=any
    Status Should Be                                    201                      ${res}
    ${orderId}             Set Variable                 ${res.json()}[orderId]
    Set Suite Variable      ${order_id}                 ${orderId}
    RETURN                                              ${order_id}