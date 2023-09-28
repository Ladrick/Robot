*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures for login 
Suite teardown     Teardown procedures

*** Variables ***
${login}        han.solo@rebellion.com
${password}     password123 

*** Test Cases ***
Login with valid credentials 
    Input credentials    ${login}    ${password}
    Scroll Element Into View      //*[@type="submit"]
    Click Button    //*[@type="submit"] 
    Wait Until Element Is Visible    //*[@class="text-decoration-underline"]
    Element Text Should Be    //*[@class="text-decoration-underline"]    Hello, Han Solo!
    