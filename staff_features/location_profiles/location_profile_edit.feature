Feature: Location Profile Edit
  Background:
    Given an administrator user is logged in
      And a Location Profile has been created
  Scenario: Location Profile is opened in the edit mode from the browse menu
    Given the Location Profile appears in the search results list
     When the user clicks on 'Edit'
     Then the Location Profile is opened in the edit mode
  Scenario: Location Profile is opened in the edit mode from the view mode
    Given the Location Profile is opened in the view mode
     When the user clicks on 'Edit'
     Then the Location Profile is opened in the edit mode
  Scenario Outline: Location Profile is successfully updated
    Given the Location Profile is opened in the view mode
     When the user clicks on 'Edit'
      And the user changes the '<Field>' field to '<NewValue>'
      And the user clicks on 'Save'
     Then the field '<Field>' has value '<NewValue>'
      Examples:
       | Field | NewValue |
       | Name  | New Name |
  Scenario: Location Profile is not updated after changes are canceled
    Given the Location Profile is opened in edit mode
     When the user changes the 'Name' field
      And the user clicks on 'Cancel'
     Then the Location Profile Name field has the original value
  Scenario: Location Profile update fails due to missing required field
    Given the Location Profile is opened in edit mode
     When the user clears the 'Name' field
      And the user clicks on 'Save'
     Then the following error message is displayed
       | Name - Property is required but was missing |
      And the Location Profile Name field has the original value