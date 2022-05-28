*** Settings ***
Library         OperatingSystem
Library         String
Library         Collections
Library         Process
Library         pabot.PabotLib
Library         ${EXECDIR}/src/customlibrary/custom.py

*** Variable ***  
${app}=      ${EXECDIR}/ApiDemos-debug.apk
${appActivity}=  io.appium.android.apis.ApiDemos
${app_package}=  io.appium.android.apis
*** Keywords ***
Setup Test
    ${valuesetname}=    Acquire Value Set
    Log to console    ${valuesetname}
    ${used_udid}=     Get Value From Set   udid
    Set Global Variable    ${used_udid}
    Log to console    ${used_udid}

    ${used_appiumPort}=     Get Value From Set   appium_port
    Set Global Variable    ${used_appiumPort}
    Log to console    ${used_appiumPort}

    ${used_system_port}=     Get Value From Set   system_port
    Set Global Variable    ${used_system_port}
    Log to console    ${used_system_port}

    ${package}=    Set Variable        com.google.android.calculator
    ${appium_server}    Set Variable    http://127.0.0.1:${used_appiumPort}/wd/hub

    Open Application
    ...   ${appium_server}
    ...   platformName=Android
    ...   app=${app}
    ...   appPackage=${app_package}
    ...   appActivity=${appActivity}
    ...   noReset=false
    ...   udid=${used_udid}
    ...   systemPort=${used_system_port}
    ...   automationName=uiautomator2
    ...   newCommandTimeout=10000

Teardown Test
    Release value set
    Close Application