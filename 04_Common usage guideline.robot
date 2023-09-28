*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures        
Suite teardown     Teardown procedures

*** Variables ***
${login}        darth.sidious@galacticempire.com
${password}     password123 



*** Test Cases ***
Creating a Guideline
    Create document    testnumber    Guideline    testdesciption    Common usage
Searching for a Guideline
    Search for document    ${documentnumber}
Editing a Guideline
    Enter document    ${documentnumber}
    Edit document    ${documentnumber} edited    Guideline    Edited description    Common usage
Deleting a Guideline
    Search for document    ${documentnumber} edited
    Delete document
