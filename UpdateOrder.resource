*** Settings ***
Library                     RequestsLibrary
Library                     JSONLibrary
Library                     String
*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

*** Keywords ***
Update an order
    ${json}
    ...    Load Json From File
    ...    apiTesting/templates/customer_name.json
    Log    ${json}
    ${json}
    ...     Update Value To Json
    ...     ${json}
    ...     $.customerName
    ...     vishnu
    Log     ${json}
    ${Authorization}                                    Create Dictionary        Authorization=Bearer ${barear_token}
    ${res}                                              PATCH                     ${url}/orders/${order_id}                 headers=${Authorization}     json=${json}     expected_status=any
    Status Should Be                                    204                     ${res}