Feature: Resource Merge
  Background:
    Given an administrator user is logged in
      And a Resource with name 'A' has been created
      And a Resource with name 'B' has been created
  Scenario: Merge two Resources by browsing Resource
    Given the Resource 'A' is opened in edit mode
     When the user clicks on 'Merge'
      And the user clicks on 'Browse' in the dropdown menu
      And the user selects Resource 'B'
      And the user clicks on 'Link'
      And the user clicks on 'Merge' in the confirm popup
     Then the 'Resource' merged message is displayed
      And the data from Resource 'B' is added to the Resource 'A'
      And the Resource 'B' is deleted
  Scenario: Merge two Resources by searching the Resource
    Given the Resource 'A' is opened in edit mode
     When the user clicks on 'Merge'
      And the user fills in 'Resource' with 'B'
      And the user selects 'B' from the suggestions
      And the user clicks on 'Merge'
      And the user clicks on 'Merge' in the confirm popup
     Then the 'Resource' merged message is displayed
      And the data from Resource 'B' is added to the Resource 'A'
      And the Resource 'B' is deleted
    Scenario: Cancel Merge Before Confirmation
      Given the Resource 'A' is opened in edit mode
       When the user clicks on 'Merge'
        And the user fills in 'Resource' with 'B'
        And the user selects 'B' from the suggestions
        And the user clicks on 'Merge'
        And the user clicks on 'Cancel' in the confirm popup
       Then the confirm popup is disappeared
        And the Resources are not changed
      