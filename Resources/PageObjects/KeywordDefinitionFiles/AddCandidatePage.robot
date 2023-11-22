*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/AddCandidateLocators.py

*** Keywords ***
Create a new Candidate
    [Arguments]     ${fisrtname}    ${middlename}   ${lastname}     ${email}
    Wait Until Element Is Visible       ${FirstNameField}           timeout=10
    Input Text      ${FirstNameField}               ${fisrtname}
    Input Text      ${MiddleNameField}              ${middlename}
    Input Text      ${LastNameField}                ${lastname}
    Input Text      ${EmailField}                   ${email}
    Click Element   ${VacancyListBox}
    Wait Until Element Is Visible       ${VacancyListItem}           timeout=10
    Click Element   ${VacancyListItem}
    Click Element   ${SaveButton}
    Sleep   3s