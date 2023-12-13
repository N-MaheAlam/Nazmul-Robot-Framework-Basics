
*** Settings ***
Library    Collections

*** Test Cases ***
Play Aournd With Dictionary
    # This is used to create a Dictionary "&" always used to create dictionary and when we 
    #want to use this we need to use "$" sign.
    &{myDetails}=    Create Dictionary    name=Nazmul Mahe Alam    age=29    status=Marriage
    Log    ${myDetails}
    Log    ${myDetails}[name]
    Dictionary Should Contain Key   ${myDetails}    name

    ${married}=    Get From Dictionary    ${myDetails}    status
    Log    ${married}