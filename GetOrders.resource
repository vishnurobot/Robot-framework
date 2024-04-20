*** Settings ***
Library                                RequestsLibrary
Library                                JSONLibrary



*** Variables ***
${url}                                             http://simple-grocery-store-api.online/

*** Keywords ***
Get orders
   [Arguments]                                         ${order_type}=created
    ${Authorization}                                    Create Dictionary        Authorization=Bearer ${barear_token}
    ${res}                                              GET                     ${url}/orders/${order_id}                 headers=${Authorization}          expected_status=any
     IF    '${order_type}' == 'created'
              Status Should Be                                    200                     ${res}
              Should Be Equal As Strings                          ${order_id}             ${res.json()}[id]
              Should Be Equal As Strings                          praveen ayyar            ${res.json()}[customerName]
     ELSE

          Status Should Be                                    404                     ${res}
     END

#    Should Be Equal As Integers                          033df2018783616643638ab2c9334b9851dfb0bd067fda3903bdb303d37efd12           ${res.json()}[createdBy]
#    Should Be Equal As Numbers                          2024-03-20T18:55:00.548Z     ${res.json()}[created]
#    Should Be Equal As Numbers                         1710960900548                ${res.json()}[timestamp]
#    Should Be Equal                          False                        ${res.json()}[processed]