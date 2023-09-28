*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures for login
Suite teardown     Teardown procedures


*** Test Cases ***
Login with invalid credentials
    Input credentials    asdasd    klsakd
    Scroll Element Into View      //*[@type="submit"]
    Click Button    //*[@type="submit"] 
    Wait Until Element Is Visible    //*[@class="text-danger"] 
    Element Text Should Be     //*[@class="text-danger"]      Invalid credentials 
    