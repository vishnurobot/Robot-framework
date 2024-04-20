*** Settings ***
Library                         RequestsLibrary


*** Variables ***
${url}                                             http://simple-grocery-store-api.online/


*** Keywords ***
Get all products API
     ${resp}                                            GET                              ${url}/products/      expected_status=200
     ${lenth_response}                                  Get Length                       ${resp.json()}
     Status Should Be                                   200                              ${resp}
     Should Be Equal As Integers                        20                               ${lenth_response}
     Should Be Equal As Integers                        4643                             ${resp.json()}[0][id]
     Should Be Equal As Strings                         coffee                           ${resp.json()}[0][category]
     Should Be Equal As Strings                         Starbucks Coffee Variety Pack, 100% Arabica    ${resp.json()}[0][name]
     Should Be Equal As Strings                         True                             ${resp.json()}[0][inStock]