*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  Firefox
${URL}  https://www.facebook.com/

*** Test Cases ***
TC001
    Open Browser  ${URL} ${Browser}
    Maximize Browser Window
    Input Text  id:email  hello
    Input Text  id:pass  Abcd
    Click Button  xpath://input[@type='sub']

    #Close Browser

*** Keywords ***
