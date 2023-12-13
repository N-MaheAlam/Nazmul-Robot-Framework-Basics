*** Settings ***
Documentation    To validate the login form using CSV File
Library    SeleniumLibrary
Test Setup    Open The Browser With The Rahul Shetty Url
#This Library to call data file  #This is calling the file    #this 2 arguments needs to run in MAC
Library    DataDriver    file=resource/datafile.csv    encoding=utf_8    dialect=unix
#All the test cases from csv file will fall under this template
Test Template    Validate Unsuccessful Login
Resource    resource.robot



*** Test Cases ***
...    This will work as a Replacement of our test cases in CSV File
#But This test case will not run asa test case but a blue print
#But If we don't define any test case name in csv or xsl file, the data without test case name
#from csv file will use this as there test case name and will modify with the username &password
#means such as From dataFile.csv and login with user Nazmul and pass Alam will be the test case
#name. Check in report.html file after running the test
From dataFile.csv and login with user ${username} and pass ${password}    defultName    defualtPass
*** Keywords ***
Validate Unsuccessful Login
    #This Arugument should be same name as CSV file such here we declare as ${username}, 
    #So In CSV file it should be "${username}" with dollar sign , curly braces everything
    [Arguments]    ${username}    ${password}
    
    File The Login Form    ${username}    ${password}
    Wait Until It Checks And Display Error Message
    Verify Error Message Is Correct


File The Login Form
    #Comes from the Above "File The Login Form    ${username}    ${password}"
    [Arguments]    ${userKey}    ${passKey}
    Input Text    id:username    ${userKey}
    Input Text    id:password    ${passKey}
    Click Button    signInBtn

Wait Until It Checks And Display Error Message
    Wait Until Element Is Visible    css:.alert-danger

Verify Error Message Is Correct
    #Decalring variables
    ${errorMessage}=    Get Text    css:.alert-danger
    Should Be Equal As Strings   ${errorMessage}     Incorrect username/password.