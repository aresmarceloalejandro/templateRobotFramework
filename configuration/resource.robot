*** Settings ***
Library                     BuiltIn
Library                     Collections
Library                     DateTime
Library                     String
Library                     RequestsLibrary
Library                     JSONLibrary
Library                     ScreenCapLibrary
Library                     SeleniumLibrary
Library                     ../data/commonFuctions.py
Resource                    resource_${PLATFORM}.robot
Resource                    ../task/APITest.robot
Resource                    ../actions/CommonActions.robot
Resource                    ../questions/CommonQuestions.robot



*** Variables ***
${ENV}                  qa
${PLATFORM}             web
${HEADLESS}             FALSE
${RECORD_VIDEO}         FALSE
${WEB_URL}              https://demo${ENV}.com/
${API_URL}              https://petstore.swagger.io/v2
${TIME_OUT}             40
