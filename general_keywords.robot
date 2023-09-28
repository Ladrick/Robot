*** Settings ***
Library          SeleniumLibrary
Library          String

*** Variables ***

${browser}      Firefox
${url}          http://46.23.37.85:8000/ 
${documentnumber}    ${EMPTY}

*** Keywords ***
Setup procedures for login
    Open browser     ${url}    ${browser}
    Set Window Size    1920  1080

Setup procedures
    Open browser     ${url}    ${browser}
    Set Window Size    1920  1080
    Input credentials    ${login}    ${password}
    Scroll Element Into View      //*[@type="submit"]
    Click Button    //*[@type="submit"] 

Teardown procedures
    Log out
    Close Browser

Teardown procedures for login
    Close browser

Log out
    Click application element    //input[@value="Log out"] 
    Wait Until Element Is Visible    //input[@id="Email"]
    Wait Until Element Is Visible    //input[@id="Password"]

Check document data 
    [Arguments]    ${xpath}    ${data} 
    List Selection Should Be    ${xpath}    ${data}
    # Element Text Should Be    ${xpath}    ${data}
    

Input credentials
    [Arguments]    ${login}    ${password}
    Input Password   //input[@id="Email"]        ${login} 
    Input Password   //input[@id="Password"]     ${password}    

Input application text
    [Arguments]    ${xpath}    ${text}
    Wait Until Element Is Visible    ${xpath}
    Wait Until Element Is Enabled    ${xpath}
    Input Text    ${xpath}  ${text}  

Click application element
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    ${xpath}
    Wait Until Element Is Enabled    ${xpath}
    Click Element    ${xpath}

Search for document
    [Arguments]    ${number}
    Input application text    //input[@id="seachValue"]      ${number}
    Click Element    //input[@value="Search"] 

Enter document
    [Arguments]    ${number}
    Click application element    //a[text()[contains(.,'${number}')]]

Edit document
    [Arguments]    ${number}    ${type}    ${description}    ${confidentiality}
    Input application text       //input[@id="NormativeDocument_DocumentNumber"]    ${number}
    Select From List By Label    //select[@id="NormativeDocument_DocumentTypeId"]    ${type}
    Input text       //input[@id="NormativeDocument_Description"]    ${description}
    Select From List By Label    //select[@id="NormativeDocument_ConfidentialityLevelId"]    ${confidentiality}
    Click Button    //input[@value="Save"]

Click cancel button
    Click Element    //a[@href="/Home" and @class="btn btn"]
    

Create document
    [Arguments]    ${number}    ${type}    ${description}    ${confidentiality}
    ${randomstring}    Generate Random String    4
    Click application element    //button[@value="Create"]
    Input application text       //input[@id="NormativeDocument_DocumentNumber"]    ${number}-${randomstring}
    Select From List By Label    //select[@id="NormativeDocument_DocumentTypeId"]    ${type}
    Input text       //input[@id="NormativeDocument_Description"]    ${description}-${randomstring}
    Select From List By Label    //select[@id="NormativeDocument_ConfidentialityLevelId"]    ${confidentiality}
    Click Element    //input[@value="Create"]
    Set Suite Variable   ${documentnumber}      ${number}-${randomstring}

Delete document
    Click application element    //*[contains(@onclick, 'deleteNormativeDocument')]
    Click Button    //button[@class="btn btn-danger" and @type="submit"]