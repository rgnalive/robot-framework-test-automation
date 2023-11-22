*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/RecruitmentLocators.py

*** Keywords ***
Search for a Candidate name
    [Arguments]     ${candidate_name}
    Click Element                       ${ExpandCandidatesFormArrowButton}
    Wait Until Element Is Visible       ${CandidateNameField}           timeout=10
    Input Text                          ${CandidateNameField}           ${candidate_name}
    Wait Until Element Is Visible       ${CandidateNameList}  timeout=10
    Sleep                               2s                              
    Click Element                       ${CandidateNameList}
    Click Element                       ${SearchButton}
    Sleep                               3s                              Wait for the item searched to appear on the grid

Should show the Candidate in the Grid
    [Arguments]                         ${candidate_name}
    ${name_searched} =                  Get Text                        ${CardCandidateName}
    Should Contain                      ${name_searched}                ${candidate_name}