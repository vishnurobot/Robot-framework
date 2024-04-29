*** Settings ***
Library                                         SeleniumLibrary


*** Variables ***
${base_url}                                     https://rahulshettyacademy.com/seleniumPractise/#/
${browser}                                      edge









*** Test Cases ***
Green cart items add into dictionary
    Open Browser                                ${base_url}                ${browser}

