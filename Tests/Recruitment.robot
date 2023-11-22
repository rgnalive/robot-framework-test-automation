*** Settings ***

Documentation   Tests the Recruitment feature, search a Candidate and add one.

Resource        ../Resources/PageObjects/KeywordDefinitionFiles/Common.robot
Resource        ../Resources/PageObjects/KeywordDefinitionFiles/HomePage.robot
Resource        ../Resources/PageObjects/KeywordDefinitionFiles/RecruitmentPage.robot
Resource        ../Resources/PageObjects/KeywordDefinitionFiles/AddCandidatePage.robot
Variables       ../Resources/PageObjects/Locators/HomeLocators.py
Variables       ../Resources/PageObjects/Locators/RecruitmentLocators.py

Test Setup      Go to the site and login   ${url_base}     chrome
Test Teardown   End session

*** Test Cases ***

Search for a candidate
    [tags]                                      recruitment     search
    Go to Recruitment page
    Search for a Candidate name                 Chris
    Should show the Candidate in the Grid       Chris Harris

Add new candidate
    [tags]                                      recruitment     create
    Go to Recruitment page
    Click Element                               ${AddButton}
    ${random_string}=    Generate Random String    10    [CHARACTERS]
    Create a new Candidate                      ${random_string}   Test    Test2   jubis.test@email.com
    Go to Recruitment page
    Search for a Candidate name                 ${random_string}
    Should show the Candidate in the Grid       ${random_string} Test

Edit a candidate

Delete a candidate