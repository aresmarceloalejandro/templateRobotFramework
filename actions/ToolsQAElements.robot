*** Settings ***
Resource                    ../configuration/resource.robot

*** Variables ***
@{CARDS_LIST}    //div[@class='card mt-4 top-card']//div[@class='card-body']
@{LIST_ITEM}     //*[@id="item-3"]
${draggable}     //*[@id="draggable"]
${droppable}     //*[@id="droppable"]

*** Keywords ***
Get Card List 
    [Arguments]     ${type}
    FOR    ${elementCard}    IN    @{CARDS_LIST}
        ${textValue}=    Wait For Element And Get Text    ${elementCard}
        Log To Console    TextValue from Card: ${textValue}
        Run Keyword If    '${textValue}' == '${type}'    Wait For Element And Click    ${elementCard}
    END

Droppable LI
    FOR    ${elementDrag}    IN    @{LIST_ITEM}
        ${textValue} =      Wait For Element And Get Text    ${elementDrag}/span
        Log To Console    TextValue from DragAndDrop: ${textValue}
        IF     ('${textValue}' == 'Droppable')
            Wait For Element And Click    ${elementDrag}
        END
    END

Drag And Drop Element
    Wait Until Element Is Visible                       ${draggable}                timeout=${timeout}
    Drag And Drop    ${draggable}     ${droppable}