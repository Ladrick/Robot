*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures        
Suite teardown     Teardown procedures

*** Variables ***
${login}        han.solo@rebellion.com
${password}     password123 



*** Test Cases ***
Creating a Policy
    Create document    testnumber    Policy    testdesfciption    Public
Searching for a Policy
    Search for document    ${documentnumber}
Editing a Policy
    Enter document    ${documentnumber}
    Edit document    ${documentnumber} edited    Policy    Edited description    Public
Deleting a Policy
    Search for document    ${documentnumber} edited
    Delete document
