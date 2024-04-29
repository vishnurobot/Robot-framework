*** Settings ***
Library                                 SeleniumLibrary



*** Variables ***
${Base_url}                                         https://rahulshettyacademy.com/client
${browser}                                           edge
${email}                                             //input[@placeholder='email@example.com']
${email_text}                                        nagarjuna1990@gmail.com
${password}                                          //input[@id='userPassword']
${password_text}                                     Test@2889
${login}                                             id:login
${home_page}                                         Login Successfully





*** Keywords ***
 Login lets shopping
  Open Browser                                       ${Base_url}                       ${browser}
  Maximize Browser Window
  Set Selenium Implicit Wait                         10 S
  Set Selenium Page Load Timeout                       30s
  Input Text                                         ${email}                          ${email_text}
  Input Text                                         ${password}                       ${password_text}
  Click Element                                      ${login}
  Page Should Contain                                ${home_page}
  Click Element                                      //b[text()='ZARA COAT 3']/parent::h5/following-sibling::button[@style='float: right;']/child::i