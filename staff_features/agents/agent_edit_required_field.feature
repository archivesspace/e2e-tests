Feature: Agent Edit required fields
  Background:
    Given an administrator user is logged in
      And the user is on Agents page
  Scenario: Edit required fields for person
     When the user clicks on 'Edit required fields'
      And the user clicks on 'Person' in the dropdown menu
      And the user clicks on 'Name forms'
      And the user checks the checkbox of 'Source'
      And the user clicks on 'Save Person'
     Then the 'Source' field in 'Name forms' is required when creating a new 'Person' type agent
  Scenario: Edit required fields for family
     When the user clicks on 'Edit required fields'
      And the user clicks on 'Family' in the dropdown menu
      And the user clicks on 'Name forms'
      And the user checks the checkbox of 'Rules'
      And the user clicks on 'Save Family'
     Then the 'Rules' field in 'Name forms' is required when creating a new 'Family' type agent
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
    