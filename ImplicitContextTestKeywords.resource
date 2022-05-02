# robocop: disable=ignored-data
# vim: syntax=robot
*** Settings ***
Documentation  A simple test keyword library used to demonstrate implicit context
Resource  ImplicitContextTestApplication.resource


*** Keywords ***
Robotalk Should Have Applause
  [Arguments]  ${a_robotalk}
  [Documentation]  Fails the test if the given robotalk does not have applause
  Dictionary Should Contain Key  ${a_robotalk}  applause
  Should Be True  ${a_robotalk['applause']}

Robotalk Should Not Have Applause
  [Arguments]  ${a_robotalk}
  [Documentation]  Fails the test if the given robotalk does have applause
  Dictionary Should Not Contain Key  ${a_robotalk}  applause
