*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSER}     Chrome
${URL}         https://rahulshettyacademy.com/seleniumPractise#/
&{product_dictionary}
*** Test Cases ***
Get First Row and Column Products
    [Tags]              t1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    30 s
    Set Selenium Page Load Timeout   20s
#    ${product_names}    Get WebElements    xpath=//div[@class='products']/div
    ${product_prices}    Get WebElements    //div[@class='products']/div/p
      #${product_name}    Get Text     xpath=//div[@class='products']/div[1]/h4

    FOR    ${index}    IN RANGE    1    5
        ${product_name}    Get Text     xpath=//div[@class='products']/div[${index}]/h4
        ${product_price}    Get Text    xpath=//div[@class='products']/div[${index}]/p
        Set To Dictionary               ${product_dictionary}    ${product_name}        ${product_price}
       Log                  ${product_dictionary}
    END

