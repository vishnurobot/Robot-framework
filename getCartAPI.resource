*** Settings ***
Library                                       RequestsLibrary

*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

*** Keywords ***
Get cart
     ${res}                           GET                          ${url}/carts/${cart_id}             expected_status=any
     Status Should Be                200                          ${res}