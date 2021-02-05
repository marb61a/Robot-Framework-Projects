*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***

*** Test Cases ***
TCList Variable Test
    @{List1}  create list  Hello 22 23.23 World Abcd1234
    ${list_length}  get length ${List1}
    log to console  ${list_length}

*** Keywords ***
