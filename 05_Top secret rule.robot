*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures        
Suite teardown     Teardown procedures

*** Variables ***
${login}        r2d2@rebellion.com
${password}     password123 



*** Test Cases ***
Creating a Rule
    Create document    testnumber    Rule    testdesciption    Top secret
Searching for a Rule
    Search for document    ${documentnumber}
Editing a Rule
    Enter document    ${documentnumber}
    Edit document    ${documentnumber} edited    Rule    Edited description    Top secret
Deleting a Rule
    Search for document    ${documentnumber} edited
    Delete document
