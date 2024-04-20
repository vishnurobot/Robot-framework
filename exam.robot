*** Settings ***
Library       SeleniumLibrary





*** Test Cases ***
Test01
     Open Browser                  https://www.google.com/gmail/about/                  chrome
     Maximize Browser Window
     Delete All Cookies
