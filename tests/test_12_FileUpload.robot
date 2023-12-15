*** Settings ***
Documentation    To Upload files. Using file from loacal system. You can change the file path
.Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
#This has come from resource.robot file


#this is resource file which will be used throughout the test
Resource    resource.robot
*** Variables ***
${url}=    https://www.ilovepdf.com/split_pdf
${fileUploadLocator}=    xpath://a[@id='pickfiles']
${filename}=    uploadThisFile.pdf
${file_path}=    /Users/nazmulmahealam/Desktop/Nazmul Resume for Jobs/uploadThisFile.pdf
*** Test Cases ***
Upload File In I Lobve PDF WebSite
    Open The Browser To Go I Love PDF URL
    Click on Select PDF Button
*** Keywords ***
Open The Browser To Go I Love PDF URL
    Create Webdriver    ${ChromeBrowser}
    Open Browser    ${url}    ${ChromeBrowser}    options=add_experimental_option("detach", True)
Click on Select PDF Button
   # ${file_path}=    Get File    ${CURDIR}${/}${file_name}
    Wait Until Element Is Visible   ${fileUploadLocator}

    Click Element    ${fileUploadLocator}
    Choose File    ${fileUploadLocator}    ${file_path}
