*** Settings ***
Library              RequestsLibrary
Library              SeleniumLibrary
Library              JSONLibrary


*** Variables ***
${url}                                             http://simple-grocery-store-api.online/
${prodcut_id}                                      1225
${cart_id}
*** Keywords ***
Get single product API
     ${resp}                                            GET                              ${url}/products/${prodcut_id}       expected_status=200
     ${lenth_response}                                  Get Length                       ${resp.json()}
     Should Be Equal As Integers                        1225                             ${resp.json()}[id]
     Should Be Equal As Strings                         fresh-produce                    ${resp.json()}[category]
     Should Be Equal As Strings                         1/2 in. Brushless Hammer Drill   ${resp.json()}[name]
     Should Be Equal As Strings                         True                             ${resp.json()}[inStock]






