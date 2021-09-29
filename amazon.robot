*** Settings ***
Library     SeleniumLibrary
Resource    amazon.resource
Suite Teardown    Close Browser

*** Test Cases ***

Valid login
    Open Browser to Amazon
    Go to login screen
    Enter credentials and click login button

Search for toys
    Go to main page
    Search for toys

Arrange items from low to high
    Sort items
#Add items to shopping cart
#    Click first toy
#    Add toy to cart

#Remove item from shopping cart
#   Go to shopping cart
#   Delete item
    
Valid logout
    Log out from main screen
