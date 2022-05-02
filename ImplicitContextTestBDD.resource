# robocop: disable=wrong-case-in-keyword-name,ignored-data,non-local-variables-should-be-uppercase
# vim: syntax=robot
*** Settings ***
Documentation  A simple BDD keyword library used to demonstrate implicit context in BDD tests.
Resource  ImplicitContextLibrary.resource
Resource  ImplicitContextTestKeywords.resource


*** Keywords ***
A new robotalk titled "${talk_title}"
  [Documentation]  Constructs a new robotalk object for later use
  [Tags]  out:that_robotalk
  ${a_robotalk}=  Create Robotalk  ${talk_title}
  Push Implicit Context  robotalk  ${a_robotalk}
  [Return]  ${a_robotalk}

That robotalk is complete
  [Documentation]  Sets the status of implicit that_robotalk to complete
  [Tags]  in:that_robotalk
  Set Robotalk Status  ${that_robotalk}  COMPLETE

There is a scattering of applause for that robotalk
  [Documentation]  Fails if implicit that_robotalk object does not have applause
  [Tags]  in:that_robotalk
  Robotalk Should Have Applause  ${that_robotalk}

The ${idx_name:first|second|third|fourth|fifth|last|next-to-last} robotalk is complete
  [Documentation]  Sets the status of implicit first/second/last/next-to-last robotalk to complete
  [Tags]  in:those_robotalks  out:that_robotalk
  ${a_robotalk}=  Get Implicit Context  robotalk  ${idx_name}
  Set Test Variable  $that_robotalk  ${a_robotalk}
  Set Robotalk Status  ${a_robotalk}  COMPLETE

There is a scattering of applause for the ${idx_name:first|second|third|fourth|fifth|last|next-to-last} robotalk
  [Documentation]  Fails if implicit first/second/last/next-to-last robotalk does not have applause
  [Tags]  in:those_robotalks  out:that_robotalk
  ${a_robotalk}=  Get Implicit Context  robotalk  ${idx_name}
  Set Test Variable  $that_robotalk  ${a_robotalk}
  Robotalk Should Have Applause  ${a_robotalk}

The ${idx_name:first|second|third|fourth|fifth|last|next-to-last} robotalk has not yet received applause
  [Documentation]  Fails if implicit first/second/last/next-to-last robotalk has received applause
  [Tags]  in:those_robotalks  out:that_robotalk
  ${a_robotalk}=  Get Implicit Context  robotalk  ${idx_name}
  Set Test Variable  $that_robotalk  ${a_robotalk}
  Robotalk Should Not Have Applause  ${a_robotalk}
