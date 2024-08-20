# QA-Automation RobotFramework

## Installation
* Install Python https://www.python.org/downloads/
* Go to the demo-robotframework main proyect.
* Run in the console: ``` pip install -r .\requirements.txt ```

## How To Run It
There are 2 ways to run the automation process.
* Run in the console: ``` robot --outputdir ./report ./tests/ ```
* Go to tests folder and run by Test Case or All of them.

## How To Run It in Paralell
* Run in the console: ```  pabot --processes 3 --outputdir ./report ./tests/ ```

## If it asks for report creation permissions, run this in PowerShell (it only happens in Windows)
* Open PowerShell and type: ```  Set-ExecutionPolicy RemoteSigned ```

## If want to generate Allure Report
#### Installation
* npm install -g allure-commandline

#### How To Run It
* Run in the console: ``` robot --outputdir ./report --listener 'allure_robotframework;./report/allure' ./tests/ ```
* Run in the console: ``` allure generate ./report/allure -o ./report/allure-report ```
* Run in the console: ``` allure-combine ./report/allure-report ```

#### Run Allure Full Command
* Run in the console: ``` robot --outputdir ./report --listener 'allure_robotframework;./report/allure' ./tests/ ; allure generate ./report/allure -o ./report/allure-report ; allure-combine ./report/allure-report ```