*** Settings ***
Resource                    ../actions/ToolsQAElements.robot

*** Variables ***
${screenshotName}    DragAndDrop
*** Keywords ***
Get Card and drag and drop
    [Arguments]    ${element}
    #Get Card List    ${element}
    Drag And Drop Element
    Capture Page Screenshot                             ${SUITE_NAME}_${screenshotName}.png