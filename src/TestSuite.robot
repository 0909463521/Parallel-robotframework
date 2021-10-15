*** Settings ***
Resource        ../config.robot
Resource        ${EXECDIR}/src/Step.robot

Test Setup       Setup Test
Test Teardown    Teardown Test


*** Test Cases ***
Successful Drag and Drop View
    Given User Click View
    When User Click Drag and Drop
    Then User see correct title of Page Drag and Drop


Successful Custom View
    Given User Click View
    When User Click Custom
    Then User see correct title of Page Custom
