# robocop: disable=wrong-case-in-keyword-name,ignored-data
# vim: syntax=robot
*** Settings ***
Documentation  A simple BDD keyword library used to demonstrate implicit context in BDD tests.
Resource  ImplicitContextLibrary.resource
Resource  ImplicitContextTestKeywords.resource


*** Keywords ***
A new robotalk titled "${talk_title}"
  [Documentation]  Constructs a new robotalk object for later use
  ${a_robotalk}=  Create Robotalk  ${talk_title}
  Push Implicit Context  robotalk  ${a_robotalk}
  [Return]  ${a_robotalk}

That robotalk is complete
  [Documentation]  Sets the status of implicit that_robotalk to complete
  Set Robotalk Status  ${that_robotalk}  COMPLETE

There is a scattering of applause for that robotalk
  [Documentation]  Fails if implicit that_robotalk object does not have applause
  Robotalk Should Have Applause  ${that_robotalk}

The ${idx_name:first|second|third|fourth|fifth|last|next-to-last} robotalk is complete
  [Documentation]  Sets the status of implicit first/second/last/next-to-last robotalk to complete
  ${a_robotalk}=  Get Implicit Context  robotalk  ${idx_name}
  Set Robotalk Status  ${a_robotalk}  COMPLETE

There is a scattering of applause for the ${idx_name:first|second|third|fourth|fifth|last|next-to-last} robotalk
  [Documentation]  Fails if implicit first/second/last/next-to-last robotalk does not have applause
  ${a_robotalk}=  Get Implicit Context  robotalk  ${idx_name}
  Robotalk Should Have Applause  ${a_robotalk}

The ${idx_name:first|second|third|fourth|fifth|last|next-to-last} robotalk has not yet received applause
  [Documentation]  Fails if implicit first/second/last/next-to-last robotalk has received applause
  ${a_robotalk}=  Get Implicit Context  robotalk  ${idx_name}
  Robotalk Should Not Have Applause  ${a_robotalk}
