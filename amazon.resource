*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com/
${BROWSER}    Chrome
${USER}    vofegeg525@aethiops.com

*** Keywords ***
Open Browser to Amazon
    Open Browser       ${URL}      ${BROWSER}
    Maximize Browser Window
Go to login screen
    Click element   id:nav-link-accountList-nav-line-1

Enter credentials and click login button
    Input Text    id:ap_email    ${USER}
    Click Button    id:continue
    Input Text    id:ap_password    tester
    Click Button    id:signInSubmit

Go to main page
    Go to     ${URL}

Search for toys
    Input Text     id:twotabsearchtextbox    toys
    Click Element        nav-search-submit-button

Log out from main screen
    Wait Until Element Is Visible    xpath://*[@id="nav-link-accountList"]/span
    Mouse Over      xpath://*[@id="nav-link-accountList"]/span
    Click Element    //*[@id="nav-item-signout"]/span    

