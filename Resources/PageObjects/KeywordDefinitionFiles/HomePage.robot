*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/LoginLocators.py
Variables   ../Locators/HomeLocators.py
Variables   ../Locators/RecruitmentLocators.py

*** Keywords ***
Go to Recruitment page
    Wait Until Element Is Visible       ${RecruitmentMenuItem}  timeout=10
    Click Element           ${RecruitmentMenuItem}
    Wait Until Element Is Visible       ${ExpandCandidatesFormArrowButton}  timeout=10
    Sleep   2s
