*** Settings ***

Documentation   Tests the Login feature, focusing on the security and the success cases.

Resource        ../Resources/PageObjects/KeywordDefinitionFiles/Common.robot
Resource        ../Resources/PageObjects/KeywordDefinitionFiles/LoginPage.robot
Variables       ../Resources/PageObjects/Locators/LoginLocators.py
Variables       ../Resources/PageObjects/TestData/TestData.py

Test Setup      Begin session   ${url_base}     chrome
Test Teardown   End session

*** Test Cases ***

Login successful
    [tags]                                      login   success
    Submit the login credentials                ${Username}      ${Password}
    Should open the logged page

Invalid password
    [tags]                                      login   exception
    Submit the login credentials                ${Username}      1234567
    Should return an error message              Invalid credentials

# *** Keywords ***

# Submit the login credentials
#     [Arguments]                                 ${username}     ${password}
#     Input Text                                  css:input[name=usuario]     ${username}
#     Input Text                                  css:input[name=senha]       ${password}
#     Click Element                               css:button[name='action']

# Should open the Welcome page
#     [Arguments]                                 ${name}
#     Page Should Contain                         Boas vindas, ${name}!


# Should return an error message
#     [Arguments]                                 ${expected_message}
#     ${given_message} =                          Get webElement  id:toast-container
#     Should Contain                              ${given_message.text}   ${expected_message}