*** Settings ***
Resource                    ../configuration/resource.robot

*** Keywords ***
Close Chrome Browser
    Stop Screen Recording   ${RECORD_VIDEO}
    Close All Browsers

Open Chrome Browser
    [Arguments]             ${url}=${EMPTY}
    Log To Console          La URL es : ${url}
    ${CHROME_OPTIONS}       Evaluate                    selenium.webdriver.ChromeOptions()
    Call Method             ${CHROME_OPTIONS}           add_argument                --ignore-certificate-errors
    Call Method             ${CHROME_OPTIONS}           add_argument                --start-maximized
    Call Method             ${CHROME_OPTIONS}           add_argument                --disable-dev-shm-usage
    Call Method             ${CHROME_OPTIONS}           add_argument                --no-sandbox
    Call Method             ${CHROME_OPTIONS}           add_argument                --allow-insecure-localhost
    Call Method             ${CHROME_OPTIONS}           add_argument                --incognito
    ${EXCLUDES}             Create List                 enable-logging
    Call Method  ${CHROME_OPTIONS}  add_experimental_option  excludeSwitches  ${EXCLUDES}
    IF    '${HEADLESS}' == 'TRUE'
        Call Method             ${CHROME_OPTIONS}           add_argument                --headless
    END
    IF    '${url}' == '${EMPTY}'
        Open Browser  about:blank  chrome   options=${CHROME_OPTIONS}
    ELSE
        Open Browser  ${url}  chrome    options=${CHROME_OPTIONS}
    END
    Screen Recording        ${RECORD_VIDEO}
