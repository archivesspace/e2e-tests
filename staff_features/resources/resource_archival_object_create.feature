Feature: Creating Archival Object of Resource Record
  Background:
    Given an administrator user is logged in
      And a Resource has been created
  Scenario: Create a Child Archival Object Record
    Given the Resource is opened in edit mode
    When the user clicks on 'Add Child'
    And the user fills in Title with a unique id
    And the user selects 'File' from 'Level of Description'
    And the user clicks on 'Save'
    Then the 'Archival Object' created message is displayed
    And the Archival Object is saved as a child of the selected context record
  Scenario: Create a Sibling Archival Object Record
    Given the Resource is opened in edit mode
     When the user selects an Archival Object record
      And the user clicks on 'Add Sibling'
      And the user fills in Title with a unique id
      And the user selects 'File' from 'Level of Description'
      And the user clicks on 'Save'
     Then the 'Archival Object' created message is displayed
      And the Archival Object is saved as a sibling of the selected context record
  Scenario: Duplicate Archival Object Record
    Given the Resource is opened in edit mode
     When the user selects an Archival Object record
      And the user clicks on 'Add Duplicate'
     Then the 'Archival Object' duplicated message is displayed
     When the user clicks on 'Save'
     Then the 'Archival Object' created message is displayed
      And the Archival Object is saved as a duplicated of the selected archival object
