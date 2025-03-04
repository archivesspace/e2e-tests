Feature: Location Profile Create
  Background:
    Given an administrator user is logged in
  Scenario: Open new Location Profile page from Manage Location Profile
     When the user clicks on 'System'
      And the user clicks on 'Manage Location Profiles' in the dropdown menu
      And the user clicks on 'Create Location Profile'
     Then the user is on the New Location Profile page
  Scenario: Location Profile is created
    Given the user is on the New Location Profile page
     When the user fills in 'Name' with 'Test Location Profile'
      And the user fills in 'Depth' with '90'
      And the user fills in 'Height' with '90'
      And the user fills in 'Width' with '90'
      And the user clicks on 'Save'
     Then the 'Location Profile' created message is displayed
      And the Location Profile is created
  Scenario: Location Profile is not created because required fields are missing
    Given the user is on the New Location Profile page
     When the user clicks on 'Save'
     Then the following error messages are displayed
       | Name - Property is required but was missing   |
  Scenario: Location Profile is created without providing dimensions
    Given the user is on the New Location Profile page
     When the user fills in 'Name' with 'Test Location withour dimensions'
      And the user clicks on 'Save'
     Then the 'Location Profile' created message is displayed
      And the Location Profile is created
      And the following message is displayed
       | Please note, dimension units, depth, height and width are all required by the space calculator. Locations will be omitted from the results if any of these values are missing. |