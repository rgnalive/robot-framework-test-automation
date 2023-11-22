*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/LoginLocators.py
Variables   ../Locators/HomeLocators.py

*** Keywords ***
Submit the login credentials
    [Arguments]             ${username}             ${password}
    Input Text              ${UsernameField}        ${username}
    Input Text              ${PasswordField}        ${password}
    Click Element           ${SubmitButton}

Should open the logged page
    Wait Until Element Is Visible  ${UserDropdown}  timeout= 5
    ${given_url} =          Get Location
    Should Contain          ${given_url}            dashboard/index

Should return an error message
    [Arguments]             ${expected_message}
    Wait Until Element Is Visible  ${ErrorMessage}  timeout= 5
    ${given_message}=       Get Text                ${ErrorMessage}
    Should Contain          ${given_message}        ${expected_message}