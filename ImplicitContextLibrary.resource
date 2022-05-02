# robocop: disable=ignored-data
# vim: syntax=robot
*** Settings ***
Documentation  A simple robotframework resource for using implicit context in BDD tests.
Library  Collections


*** Variables ***
&{IMPLICIT_CTX_IDX_NAMES}=  first=0  second=1  third=2  fourth=3  fifth=4  sixth=5  seventh=6  last=-1  next-to-last=-2


*** Keywords ***
Push Implicit Context
  [Arguments]  ${ctx_name}  ${ctx_object}  ${scope}=Test
  [Documentation]  Adds a "that_ctx_name" variable and builds a "that_ctx_names" stack.
  Run Keyword  Set ${scope} Variable  $that_${ctx_name}  ${ctx_object}
  ${ctx_stack}=  Get Variable Value  $those_${ctx_name}s  @{EMPTY}
  Append To List  ${ctx_stack}  ${ctx_object}
  Run Keyword  Set ${scope} Variable  $those_${ctx_name}s  ${ctx_stack}

Get Implicit Context
  [Arguments]  ${ctx_name}  ${ctx_idx_name}
  [Documentation]  Gets the appropriate object (first|second|last|next-to-last|etc.)  from the "that_ctx_names" stack.
  ${ctx_idx}=  Get From Dictionary  ${IMPLICIT_CTX_IDX_NAMES}  ${ctx_idx_name}
  ${ctx_object}=  Get From List  ${those_${ctx_name}s}  ${ctx_idx}
  [Return]  ${ctx_object}
