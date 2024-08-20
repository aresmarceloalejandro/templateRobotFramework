*** Settings ***
Resource                    ../configuration/resource.robot


*** Keywords ***
Must Be Negative
    [Arguments]             ${expected}
    ${expectedString}       Convert To String           ${expected}
    Should Contain          false                       ${expectedString.lower()}

Must Be True
    [Arguments]             ${expected}
    Should Be True          ${expected}
    Log INFO Menssaje: Expected Result Is True

The Number ${expected} Is The Same As ${result}
    Should Be Equal As Numbers                          ${expected}                 ${result}
    Log INFO Menssaje: ${expected} Is The Same Number Of ${result}

The String ${expected} Is The Same As ${result}
    Should Be Equal As Strings                          ${expected}                 ${result}
    Log INFO Menssaje: ${expected} Is The Same String Of ${result}
