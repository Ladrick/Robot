*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures        
# Suite teardown     Teardown procedures

*** Variables ***
${login}        r2d2@rebellion.com
${password}     password123 



*** Test Cases ***
Changing document type
    Create document    testnumber    Rule    testdesciption    Top secret
    Search for document    ${documentnumber}
    Enter document    ${documentnumber}
    Edit document    ${documentnumber} edited    Policy    Edited description    Top secret
    Search for document    ${documentnumber} edited
    Enter document    ${documentnumber}
    Check document data   //select[@id="NormativeDocument_DocumentTypeId"]     Policy
    Click cancel button   
    Search for document    ${documentnumber} edited
    Delete document
