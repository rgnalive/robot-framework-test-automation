*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    LoginPage.robot
Variables   ../Locators/LoginLocators.py
Variables   ../Locators/HomeLocators.py
Variables   ../TestData/TestData.py

*** Variables ***
${url_base}      https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Begin session
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      ${browser}
    Wait Until Element Is Visible  ${UsernameField}  timeout=5

End session
    Capture Page Screenshot
    Close Browser

Go to the site and login
    [Arguments]     ${url}      ${browser}
    # Set Selenium Speed    2 seconds
    Open Browser    ${url}      ${browser}
    Wait Until Element Is Visible  ${UsernameField}  timeout=5
    Input Text              ${UsernameField}        ${Username}
    Input Text              ${PasswordField}        ${Password}
    Click Element           ${SubmitButton}
    Wait Until Element Is Visible  ${RecruitmentMenuItem}  timeout=10