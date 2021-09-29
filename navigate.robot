*** Settings ***
Library    Browser
Library    String    # This is needed for String Split keyword

Library    NavigateLib.py   # Domain specified. No need to give url.

*** Test Cases ***
Test Etteplan Website With Browser
    New Browser    browser=chromium    headless=False
    New Page       url=https://www.etteplan.com/fi

    # Simple verification that we are in correct page
    Get Title      ==    Erilainen suunnittelutoimisto | Etteplan

    # You can store title in variable and do cool stuff with it
    ${title} =     Get Title
    ${str} =       Split String   ${title}    ${SPACE}|${SPACE}    # Creates list

    # Use indexes to get value from list. Start from 0
    Should Be Equal As Strings    ${str}[0]    Erilainen suunnittelutoimisto
    Should Be Equal As Strings    ${str}[1]    Etteplan

#  Works only in Etteplan FI
Test Etteplan Website With Custom Library
    Open Browser To Etteplan
    Verify Etteplan Title
    Navigate To About Us
    Verify Page Content
    [Teardown]    Cleanup
