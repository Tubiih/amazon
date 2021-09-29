*** Settings ***
Library     SeleniumLibrary
Resource    amazon.resource
Suite Teardown    Close Browser

*** Test Cases ***

Valid login
    Open Browser to Amazon
    Go to login screen
    Enter credentials and click login button

Seach for items
    Go to main page
    Search for toys

Valid logout
    Log out from main screen
