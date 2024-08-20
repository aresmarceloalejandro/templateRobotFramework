*** Settings ***
Resource                    ../configuration/resource.robot


*** Variables ***
${WARN_COLOR}           FFCC00
${ERROR_COLOR}          FF0000
${INFO_COLOR}           009933


*** Keywords ***
Get Windows And Capture Screenshot
    [Arguments]             ${screenshotName}
    ${window_handles}       Get Window Handles
    Switch Window           ${window_handles}[1]
    Sleep                   2
    IF    '${HEADLESS}' == 'FALSE'
        Capture Page Screenshot                             ${SUITE_NAME}_${screenshotName}.png
    END
    Close Window
    Switch Window           ${window_handles}[0]

Log ${level} Menssaje: ${message}
    Log
    ...  <p style="font-family:Times;font-size:14px;font-style:italic;font-weight:bold;font-variant:small-caps;color:#${${level}_COLOR};">${message}</p>
    ...  ${level}  html=true

Screen Recording
    [Arguments]             ${record}=FALSE
    IF    '${record}'=='TRUE'
        Start Video Recording  alias=MiClaro name=MiClaroRecording  fps=None  size_percentage=1  embed=True
        ...  embed_width=100px  monitor=1
    END

Stop Screen Recording
    [Arguments]             ${record}=${FALSE}
    IF  '${record}'=='TRUE'  Stop All Video Recordings  alias=MiClaro

Wait For Element And Click
    [Arguments]             ${element}                  ${timeout}=${TIME_OUT}
    Sleep                   1
    Wait Until Element Is Visible                       ${element}                  timeout=${timeout}
    Click Element           ${element}

Wait For Element And Get Attribute()
    [Arguments]             ${element}                  ${attribute}                ${timeout}=${TIME_OUT}
    Wait Until Element Is Visible                       ${element}                  timeout=${timeout}
    ${elementValue}         Get Element Attribute       ${element}                  ${attribute}
    RETURN                  ${elementValue}

Wait For Element And Get Text
    [Arguments]             ${element}                  ${timeout}=${TIME_OUT}
    Wait Until Element Is Visible                       ${element}                  timeout=${timeout}
    ${elementText}          Get Text                    ${element}
    RETURN                  ${elementText}

Wait For Element And Set Text
    [Arguments]             ${element}                  ${textValue}                ${timeout}=${TIME_OUT}
    Wait Until Element Is Visible                       ${element}                  timeout=${timeout}
    Wait Until Element Is Enabled                       ${element}                  timeout=${timeout}
    Input Text              ${element}                  ${textValue}