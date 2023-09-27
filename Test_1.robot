*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures        
# Suite teardown     Teardown procedures

*** Variables ***



*** Test Cases ***
Creating a document
    Create document    testnumber    Policy    testdesciption    Public
    Search for document    ${documentnumber}
    Enter document    ${documentnumber}
    Edit document    ${documentnumber} edited    Guideline    Edited description    Common usage
    Search for document    ${documentnumber} edited
    Delete document


*** Keywords ***
