*** Settings ***
Library                                         SeleniumLibrary

*** Variables ***
${search-1}                                               (//input[@name='search'])[2]
${product_name_add}                                      ADIDAS ORIGINAL
${price_of_product}                                     $ 31500
#${add_to_cart}                                          //button[@class='btn w-10 rounded']/i
${eye}                                                  //i[@class='fa fa-eye']
${add_cart}                                             //button[text()='Add to Cart']
${alert}                                                //div[@aria-label='Product Added To Cart']
${cart_feild}                                           //i[@class='fa fa-shopping-cart']
${invoice_id}                                           6581ca979fd99c85e8ee7faf
${check_out}                                            //button[text()='Checkout']


*** Keywords ***
lets shop adidas shoes
    Input Text                                           ${search-1}                    ${product_name_add}     enter
    Page Should Contain                                  ${price_of_product}
    Click Element                                        ${eye}
    Page Should Contain                                  ${price_of_product}
    Click Element                                        ${add_cart}
    ${alert_text}                                        Get Text                                  ${alert}
    Page Should Contain                                  ${alert_text}
    Click Element                                        ${cart_feild}
    Click Element                                        ${check_out}