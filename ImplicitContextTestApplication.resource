*** Settings ***
Documentation  A simple fake application library used to demonstrate implicit context in BDD tests.


*** Keywords ***
Create Robotalk
  [Arguments]  ${talk_title}
  [Documentation]  Creates a simple dictionary to represent a robocon talk
  ${a_robotalk}=  Create Dictionary  title=${talk_title}
  [Return]  ${a_robotalk}

Set Robotalk Status
  [Arguments]  ${a_robotalk}  ${new_status}
  [Documentation]  Sets the status of implicit that_robotalk; if complete, generates an applause property
  Set To Dictionary  ${a_robotalk}  status=${new_status}
  IF  "${new_status}"=="COMPLETE"
    Set To Dictionary  ${a_robotalk}  applause=${True}
  END
