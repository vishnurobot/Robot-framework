*** Settings ***
Library                          RequestsLibrary


*** Variables ***
${url}                                             http://simple-grocery-store-api.online/




*** Keywords ***
Get Status of API
        ${resp}                                         GET                              ${url}/status        expected_status=200
        Log To Console                                                              status=${resp.json()}
        Status Should Be                                200                              ${resp}