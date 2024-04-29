*** Settings ***
Library                 SeleniumLibrary
Library                 ./UiWaitsLibrary.py
*** Variables ***
${cvv}                                         //div[text()='CVV Code ']/following-sibling::input
${cvv_text_feild}                              123
${credit_card_number}                          //div[text()='Credit Card Number ']/following-sibling::input
${credit_card_number_text}                     4645 8879 2289 6468
${expairy_date}                                (//select[@class='input ddl'])[1]
${date}                                        11
${expairy_year}                                (//select[@class='input ddl'])[2]
${year}                                        19
${name_of_the_card}                            //div[text()='Name on Card ']/following-sibling::input
${name}                                        vishnu pesala
${select_country}                              //input[@placeholder='Select Country']
${country_name}                                 in
${countrys_list}                               //section[@class='ta-results list-group ng-star-inserted']/button/span
${place_order}                                 //a[normalize-space()="Place Order"]
${product_confirmation}                        THANKYOU FOR THE ORDER.
${invoice}                                     //button[contains(text(),'Click To Download Order Details in CSV')]


*** Keywords ***
lets shopiing payment page
    Set Selenium Speed                .2 S
    Input Text                        ${credit_card_number}   ${credit_card_number_text}
    Select From List By Label         ${expairy_date}         ${date}
    Select From List By Label         ${expairy_year}         ${year}
    Input Text                        ${cvv}                  ${cvv_text_feild}
    Input Text                        ${name_of_the_card}     ${name}
    Wait Until Element Is Visible     ${select_country}
    Input Text                        ${select_country}       ${country_name}
    ${list}                           Get WebElements                   ${countrys_list}
    Log                               ${list}
    FOR    ${element}    IN    @{list}
       ${current_text}     Get Text    ${element}
          Scroll Element Into View    ${element}
          IF    '${current_text}' == 'India'
              util:wait until element clickable    //span[normalize-space()='India']
              Click Element    ${element}
              BREAK
          END
    END
    Capture Page Screenshot

    Click Element                      ${place_order}
   # Page Should Contain                 IPHONE 13 PRO
    Click Element                      ${invoice}





