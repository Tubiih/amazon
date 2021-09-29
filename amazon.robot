*** Settings ***
Library     SeleniumLibrary
Resource    amazon.resource
Suite Teardown    Close Browser

*** Test Cases ***

Valid login
    Open Browser to Amazon
    Go to login screen
    Enter credentials and click login button

Valid logout
    Log out from main screen
    

