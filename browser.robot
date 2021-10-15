*** Settings ***

Library  Selenium2Library
Library  Collections
Library  OperatingSystem


Suite Setup      Include Browser Drivers
Test Setup  Open test browser
Test Teardown  Close test browser

*** Variables ***


${BROWSER_NAME}  chrome
${DEVICE_NAME}  Galaxy
${PLATFORM_NAME}  Android
${app}  /Users/bachvu/Desktop/basicaccessibility_1.6_clickcrash.apk
${search_loc}=     //*[@name='q']
${EXECDIR}=  /Users/bachvu/Desktop/RobotFramework/
*** Test Cases ***

Simple Test
	
	# Input Text  xpath=${search_loc} kobiton
    Comment         Open first google window

    Input Text    ${search_loc}    kobiton

    Press Keys    ${search_loc}     ENTER

    Sleep  4

    Comment         Input text to second window

    Execute Javascript    window.open('https://www.google.com')

    Switch Window   locator=NEW      

    Input Text    ${search_loc}    vnexpress

    Press Keys    ${search_loc}     ENTER

    Sleep  4

*** Keywords ***
Include Browser Drivers
    Append To Environment Variable    PATH    ${EXECDIR}/geckodriver.exe
Open test browser
	Open Browser    https://www.google.com      Chrome

	...  remote_url=http://localhost:4723/wd/hub 
	...  desired_capabilities=browserName:${BROWSER_NAME},deviceName:${DEVICE_NAME},platformName:${PLATFORM_NAME}
    # ...  ff_profile_dir=/Users/bachvu/Desktop/RobotFramework/chromedriver.exe
Close test browser
	Close all browsers
