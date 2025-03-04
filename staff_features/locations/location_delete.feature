Feature: Location Delete
  Background:
    Given an administrator user is logged in
      And a Location has been created
  Scenario: Location is deleted from the search results
     When the user clicks on 'Browse'
      And the user clicks on 'Locations'
      And the user filters by text with the Location
      And the user checks the checkbox of the Location
      And the user clicks on 'Delete'
      And the user clicks on 'Delete Records'
     Then the 'Records' deleted message is displayed
      And the Location is deleted
  Scenario: Location is deleted from the view page
    Given the user is on the Location view page
     When the user clicks on 'Delete'
      And the user clicks on 'Delete' in the modal
     Then the Locations page is displayed
      And the 'Location' deleted message is displayed
      And the Location is deleted
  Scenario: Cancel Location delete from the view page
    Given the user is on the Location view page
     When the user clicks on 'Delete'
      And the user clicks on 'Cancel'
     Then the user is still on the Location view page
  Scenario: Location is not deleted when linked to a Top Container
    Given the Location is linked to a Top Container
      And the user is on the Locaiton view page
     When the user clicks on 'Delete'
    Then the user is still on the Location view page
      And the following error message is displayed
       |Unable to delete locations: |