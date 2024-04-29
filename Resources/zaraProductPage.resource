*** Settings ***
Library                                               SeleniumLibrary
*** Variables ***
${search}                                               (//input[@name='search'])[2]
${product_name}                                         ZARA COAT 3
${price_of_product}                                     $ 31500
#${add_to_cart}                                          //button[@class='btn w-10 rounded']/i
${eye}                                                  //i[@class='fa fa-eye']
${add_cart}                                             //button[text()='Add to Cart']
${alert}                                                //div[@aria-label='Product Added To Cart']
${cart_feild}                                           //i[@class='fa fa-shopping-cart']
${invoice_id}                                           6581ca399fd99c85e8ee7f45
${check_out}                                            //button[text()='Checkout']



*** Keywords ***
Lets shop ZARA COAT 3
    Input Text                                           ${search}                   ${product_name}     enter
    Page Should Contain                                  ${price_of_product}
    Click Element                                        ${eye}
    Page Should Contain                                  ${price_of_product}
    Click Element                                        ${add_cart}
    ${alert_text}                                        Get Text                                  ${alert}
    Page Should Contain                                  ${alert_text}
    Click Element                                        ${cart_feild}
    Click Element                                        ${check_out}

