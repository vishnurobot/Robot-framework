*** Settings ***
Library                     RequestsLibrary
Library                     JSONLibrary
Library                     String
*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

*** Keywords ***
Register a new API client
    ${names}                            Generate Random String          7-15                            [LOWER]
    ${req_body}                         Create Dictionary        clientName=Postman on Valentin's computer      clientEmail=${names}@example.com
    ${res}                              POST                     ${url}/api-clients                json=${req_body}        expected_status=201
    ${accessToken}                      Set Variable                 ${res.json()}[accessToken]
    Set Suite Variable        ${barear_token}           ${accessToken}