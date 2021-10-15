*** Settings ***

*** Variable ***
${search_loc}=     //*[@name='q']
${point_drag_start}=   /hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.view.View[1]
${point_drag_des}=     /hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.view.View[3]

${btnView}             xpath=//android.widget.TextView[@content-desc="Views"]
${btnCustom}           xpath=//android.widget.TextView[@content-desc="Custom"]
${btnDragandDrop}      xpath=//android.widget.TextView[@content-desc="Drag and Drop"]

${ActualResultDragandDrop}      xpath=/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.widget.TextView
${ActualResultCustom}           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.TextView
*** Keywords ***


Func Drag and Drop app 
    # Long Press   id=io.appium.android.apis:id/drag_dot_1

    # Scroll Down  id=io.appium.android.apis:id/drag_dot_3
    Wait Until Element Is Visible   xpath=${point_drag_start}   5s
    Long Press    
    ...  xpath=${point_drag_start}  
    ...  duration=7000
   
    Scroll
    ...  xpath=${point_drag_start}
    ...  xpath=${point_drag_des}
 
    Sleep   5s
    
Tap View
    Wait Until Element Is Visible   ${btnView} 
    Click Element                   ${btnView}
    Sleep   5s

Tap Drag and Drop
    Wait Until Element Is Visible   ${btnDragandDrop} 
    Click Element                   ${btnDragandDrop}
    Sleep   5s

Tap Custom
    Wait Until Element Is Visible   ${btnCustom} 
    Click Element                   ${btnCustom}
    Sleep   5s

Assert DragandDrop result is "${expected_result}"
    Wait Until Element Is Visible   ${ActualResultDragandDrop}
    Element Text Should Be          ${ActualResultDragandDrop}      ${expected_result}  

Assert Custom result is "${expected_result}"
    Wait Until Element Is Visible   ${ActualResultCustom}
    Element Text Should Be          ${ActualResultCustom}      ${expected_result} 
    