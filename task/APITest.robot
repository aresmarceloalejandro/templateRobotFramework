*** Settings ***
Resource                    ../configuration/resource.robot

*** Variables ***
${JSON_FILE_PATH}     \\json\\postBody.json

*** Keywords ***
Example POST API
    ${headers}  Create Dictionary  Content-Type=application/json    accept=application/json 
    ${body}      Load Json File      ${JSON_FILE_PATH}
    Create Session      swaggerApi      ${API_URL}      ${headers}      disable_warnings=1
    ${response}  POST On Session  swaggerApi    /store/order      data=${body}
    Log INFO Menssaje: Api Response - ${response}
    ${complete}              Get Value From Json         ${response.json()}          $.complete
    ${status}                  Get Value From Json         ${response.json()}          $.status
    ${generationData}  Create Dictionary  status=${status[0]}  complete=${complete[0]}
    Set Suite Variable      ${THIS_DICTIONARY}          ${generationData}
    Log To Console    ${THIS_DICTIONARY}

Example GET API
    ${headers}  Create Dictionary  Content-Type=application/json    accept=application/json 
    Create Session  swaggerGetApi  ${API_URL}  ${headers}  disable_warnings=1
    ${response}   GET On Session              swaggerGetApi          /store/inventory     
    Log To Console     ${response}