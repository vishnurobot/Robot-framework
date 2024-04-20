*** Settings ***
Library                     RequestsLibrary
Library                     JSONLibrary
*** Variables ***
${url}                                             http://simple-grocery-store-api.online/
*** Keywords ***
Delete an order
    ${Authorization}                                    Create Dictionary        Authorization=Bearer ${barear_token}
    ${res}                                              DELETE                     ${url}/orders/${order_id}                 headers=${Authorization}          expected_status=any
    Status Should Be                                    204                      ${res}