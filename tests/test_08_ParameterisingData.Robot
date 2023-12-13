*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open The Browser With The Rahul Shetty Url
# For Data Parameterisation we use a Test Case (placed in keywords) where all the tests will 
#be replaced
#Such as here "Validate Unsuccessful Login" is the template where
#"Invalid UserName", "Invalid Password", "Invalid User And Password" will be used
Test Template    Validate Unsuccessful Login
Resource    resource.robot


#Resource - we will define it in later lectures
# username & password is the argument which will use the values of below test cases
*** Test Cases ***    username    password
# This test case Rabbi is username and learning is passowrd
Invalid UserName    Rabbi    learning
# This test case rahulshettyacademy is username and wrongpass is passowrd
Invalid Password    rahulshettyacademy    wrongpass
# This test case worngName is username and WrongPass is passowrd
Invalid User And Password    worngName    WrongPass


*** Keywords ***
#This looks like a test case but if any test case act as vaia test case (this below
#Validate Unsuccessful Login act as a template which will run the above 3 test cases.)
#will be placed in "Keywords"
Validate Unsuccessful Login
    #declaring arguments to use the value of username & password from above test cases
    #*** Test Cases ***    username    password
    [Arguments]    ${user}    ${pass}
    #test cases values fall under the below lines such as "Rabbi", "learning" first then,
    #"rahulshettyacademy" and "wrongpass" and finally "worngName" and "WrongPass"
    File The Login Form    ${user}    ${pass}
    Wait Until It Checks And Display Error Message
    Verify Error Message Is Correct


File The Login Form
    #Comes from the Above "File The Login Form    ${user}    ${pass}"
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