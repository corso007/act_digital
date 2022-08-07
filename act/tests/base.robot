*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${var1}                 http://automationpractice.com/index.php?controller=authentication&back=my-account

*** Keywords ***
Nova sessão
    Open Browser                    ${var1}                 chrome
    Maximize browser window
Encerra sessão
    Capture Page Screenshot
    Close Browser
