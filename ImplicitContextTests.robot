# robocop: disable=wrong-case-in-keyword-name
*** Settings ***
Documentation  A simple test suite to demonstrate implicit context in BDD tests.
Resource  ImplicitContextTestBDD.resource


*** Test Cases ***
The Implicit Context Library Can Refer to That Object
  [Documentation]  Tests that we can refer to a previous object as "that object"
  Given a new robotalk titled "Using Implicit Context"
  When that robotalk is complete
  Then there is a scattering of applause for that robotalk

The Implicit Context Library Can Refer to Objects By Position
  [Documentation]  Tests that we can refer to "the first robotalk" and "the last robotalk"
  Given a new robotalk titled "Using Implicit Context"
  And a new robotalk titled "Another Talk"
  When the first robotalk is complete
  Then there is a scattering of applause for the next-to-last robotalk
  And the last robotalk has not yet received applause

The Implicit Context Library Gives A Predictable Error Message When No That Object
  [Documentation]  Tests that we can determine error message for "that_object" for easy debugging
  Run Keyword And Expect Error  Variable '\${that_robotalk}' not found.  That robotalk is complete

The Implicit Context Library Gives A Predictable Error Message When No Those Objects
  [Documentation]  Tests that we can determine error message for "those_objects" for easy debugging
  Run Keyword And Expect Error  Variable '\${those_robotalks}' not found.  The first robotalk is complete

The Implicit Context Library Gives A Predictable Error Message When Not Enough Objects
  [Documentation]  Tests that we can determine error message for non existing indexed objects
  [Setup]  A new robotalk titled "Using Implicit Context"
  Run Keyword And Expect Error  IndexError: Given index 1 is out of the range 0-0.  The second robotalk is complete
