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

#Add toy to cart
#    Click Element    id:add-to-cart-button

#Go to shopping cart
#    Click Element    id:nav-cart-count

Sort items
    Click Element    //*[@id="a-autoid-0-announce"]/span[2]
    Click Element    //*[@id="s-result-sort-select_1"]

#Delete item
#    Click Element    //*[@id="sc-item-C46896bfb-9158-47a6-98a4-68a31e965d44"]/div[4]/div/div[1]/div/div/div[2]/div[1]/span[2]/span/input

Log out from main screen
    Wait Until Element Is Visible    xpath://*[@id="nav-link-accountList"]/span
    Mouse Over      xpath://*[@id="nav-link-accountList"]/span
    Click Element    //*[@id="nav-item-signout"]/span    

