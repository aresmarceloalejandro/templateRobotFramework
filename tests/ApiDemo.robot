*** Settings ***
Documentation               API QA Demo
Resource                    ../configuration/resource.robot

*** Variables ***

*** Test Cases ***
Api Test #1
    [Tags]                  apiPost
    Example POST API

Api Test #2
    [Tags]                  apiGet
    Example GET API    