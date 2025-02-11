Feature: Agent Edit required fields
  Background:
    Given an administrator user is logged in
      And the user is on Agents page
  Scenario: Edit required fields for person
     When the user clicks on 'Edit Required Fields'
      And the user clicks on 'Person' in the dropdown menu
      And the user checks Rest of Name in the Name Forms form
      And the user clicks on 'Save Person'
      And the user clicks on 'Create'
      And the user hovers on 'Agent' in the dropdown menu
      And the user clicks on 'Person'
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Primary Part of Name - Property is required but was missing |
       | Rest of Name - Property is required but was missing         |
  Scenario: Edit required fields for family
     When the user clicks on 'Edit Required Fields'
      And the user clicks on 'Family' in the dropdown menu
      And the user checks 'Rules'
      And the user clicks on 'Save Family'
      And the user clicks on 'Create'
      And the user hovers on 'Agent' in the dropdown menu
      And the user clicks on 'Person'
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Primary Part of Name - Property is required but was missing |
       | Rest of Name - Property is required but was missing         |
  Scenario: Edit required fields for corporate entity
     When the user clicks on 'Edit required fields'
      And the user clicks on 'Corporate Entity' in the dropdown menu
      And the user clicks on 'Name forms'
      And the user checks the checkbox of 'Rules'
      And the user clicks on 'Save Corporate Entity'
     Then the 'Rules' field in 'Name forms' is required when creating a new 'Corporate Entity' type agent
  Scenario: Edit required fields for software
     When the user clicks on 'Edit required fields'
      And the user clicks on 'Software' in the dropdown menu
      And the user clicks on 'Name forms'
      And the user checks the checkbox of 'Version'
      And the user clicks on 'Save Software'
     Then the 'Version' field in 'Name forms' is required when creating a new 'Software' type agent
