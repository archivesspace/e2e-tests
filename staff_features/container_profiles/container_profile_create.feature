Feature: Container Profile Create
  Background:
    Given an administrator user is logged in
  Scenario: Open new container profile page from Create in the main toolbar
     When the user clicks on 'Create' in the main toolbar
      And the user clicks on 'Container Profile' in the dropdown menu
     Then the user is on the New Container Profile page
  Scenario: Open new container profile page from Manage Container Profile
     When the user clicks on 'System'
      And the user clicks on 'Manage Container Profiles' in the dropdown menu
      And the user clicks on 'Create Container Profile'
     Then the user is on the New Container Profile page
  Scenario: Open new container profile page from Browse in the main toolbar
     When the user clicks on 'Browse' in the main toolbar
      And the user clicks on 'Container Profile' in the dropdown menu
      And the user clicks on 'Create Container Profile'
     Then the user is on the New Container Profile page
  Scenario: Container Profile is created
    Given the user is on the New Container Profile page
     When the user fills in 'Name' with 'Test Container'
      And the user fills in 'Depth' with '90'
      And the user fills in 'Height' with '90'
      And the user fills in 'Width' with '90'
      And the user clicks on 'Save'
     Then the 'Container Profile' created message is displayed
      And the Container Profile is created
  Scenario: Container Proofile is not created because required fields are missing
    Given the user is on the New Container Profile page
     When the user clicks on 'Save'
     Then the following error messages are displayed
       | Name - Property is required but was missing   |
       | Height - Property is required but was missing |
       | Width - Property is required but was missing  |
       | Depth - Property is required but was missing  |
  Scenario: Container Profile is not created because Depth is alphanumeric
    Given the user is on the New Container Profile page
     When the user fills in 'Name' with 'Test Container'
      And the user fills in 'Depth' with 'abc'
      And the user fills in 'Height' with '90'
      And the user fills in 'Width' with '90'
      And the user clicks on 'Save'
     Then the following error message is displayed
       | Depth - Must be a number with no more than 2 decimal places |