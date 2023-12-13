*** Settings ***
Documentation    Shows how to split text and use it in log in form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open The Browser With The Rahul Shetty Url
Resource    resource.robot

*** Variables ***


*** Test Cases ***
Validate Child Window Functionality And Use String From Child to Parent Window
    Click The Link From Parent Window
    Verify The User Is Swicthed To Child Window
    Grap The Email From Child Window By Spliting
    Place The Email To The Parent Window

*** Keywords ***
Click The Link From Parent Window
    Click Element    css:.blinkingText
    Sleep    5

Verify The User Is Swicthed To Child Window
    Switch Window     NEW
    Element Should Be Visible    css:div[class='inner-box'] h1

Grap The Email From Child Window By Spliting
    #Store the whole text
    ${wholeText}=    Get Text    css:.im-para.red
    #Split the string in "at" and store in a list
    @{divideWholeTest}=    Split String    ${wholeText}    at
    #Store the 2nd index (0, 1) = 1 in to this variable
    ${emailText}=    Get From List  ${divideWholeTest}    1
    #split the text in sapce and store the strings in a list
    @{splitEmailString}=    Split String     ${emailText}
    #get the first index(0) from the list
    ${originalEmail}=    Get From List    ${splitEmailString}    0
    #print it in the log
    Log    ${originalEmail}

    #This variable can be use thorugh this whole Keywords
    Set Global Variable   ${originalEmail}

Place The Email To The Parent Window
    Switch Window    MAIN
    Input Text    username    ${originalEmail}
    Input Text    password    learning
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    okayBtn
    Click Button    xpath://button[@class='btn btn-success']
    Select From List By Value    css:select[class='form-control']    teach
    Select Checkbox    terms
    #It checks if the check box is selected or not
    Checkbox Should Be Selected    terms
    Click Button    signInBtn