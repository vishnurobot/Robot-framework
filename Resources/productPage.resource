*** Settings ***
Library                        SeleniumLibrary

*** Variables ***
${search}                                //div[@class='py-2 border-bottom ml-3']/child::input
${prodcut_info}                          IPHONE 13 PRO
${iphone_Text}                           //b[contains(text(),'IPHONE 13 PRO')]
${verify_page}                           //div[contains(text(),'$ 231500')]
${verfy_No_of_items}                     Showing 1 results
${text}                                  User can only see maximum 9 products on a page
${eye}                                   //i[@class='fa fa-eye']
${product_text}                          Latest Apple Iphone13 pro with 200mp front camera
${add_to_cart}                           //button[contains(text(),'Add to Cart')]
${prodcut_confirmation_alert}            //div[@aria-label='Product Added To Cart']
${items_of_the_cart}                     //label[text()=1]
${cart}                                  //i[@class='fa fa-shopping-cart']
${checkout}                              //button[contains(text(),'Checkout')]




*** Keywords ***
Search for Iphone
     Input Text                           ${search}                    ${prodcut_info}          enter
     ${text}                              Get text                ${iphone_Text}
     Log To Console                       ${text}
     Page Should Contain                  ${text}
     ${veryft_text}                       Get Text                ${verify_page}
     Log To Console                        ${veryft_text}
     Page Should Contain                  ${verfy_No_of_items}
     Click Element                        ${eye}
     Page Should Contain                  ${text}
     #Page Should Contain                  ${text}
     #Page Should Contain                  ${text}
     Click Element                        ${add_to_cart}
     #Page Should Contain                   cart 1
     Click Element                        ${cart}
     Click Element                        ${checkout}











