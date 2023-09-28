*** Settings ***
Library          SeleniumLibrary
Resource         general_keywords.robot 

Suite setup        Setup procedures        
Suite teardown     Teardown procedures

*** Variables ***
${login}        luke.skywalker@rebellion.com
${password}     password123 



*** Test Cases ***
Changing document confidentiality
    Create document    testnumber    Standard    testdesciption    Public
    Search for document    ${documentnumber}
    Enter document    ${documentnumber}
    Edit document    ${documentnumber} edited    Standard    Edited description    Common usage
    Search for document    ${documentnumber} edited
    Enter document    ${documentnumber}
    Check document data   //select[@id="NormativeDocument_ConfidentialityLevelId"]     Common usage
    Click cancel button   
    Search for document    ${documentnumber} edited
    Delete document

