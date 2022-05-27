*** Settings ***
Resource           ${EXECDIR}/src/Page.robot

*** Variable ***
${global_variable}  toi la bach vu ROBOT nha
*** Keywords ***
User Click View
    Tap View

User Click Drag and Drop
    Tap Drag and Drop

User Click Custom
    Tap Custom

User see correct title of Page Drag and Drop
   Assert DragandDrop result is   Views/Drag and Drop

User see correct title of Page Custom
   Assert Custom result is  Views/Custom