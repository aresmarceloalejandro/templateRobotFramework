*** Settings ***
Documentation               Tools QA Demo
Resource                    ../configuration/resource.robot
Resource                    ../task/ToolsQAElementsTask.robot
Suite Setup                 Open Chrome Browser    ${WEB_URL}
Suite Teardown              Close Chrome Browser

*** Variables ***
${TPYE}    Interactions

*** Test Cases ***
Automation TestCase #1
    [Setup]    Go To    ${WEB_URL}droppable
    Get Card and drag and drop     ${TPYE}
