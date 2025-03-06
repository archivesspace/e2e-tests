Feature: Container Profile Delete
  Background:
    Given an administrator user is logged in
      And a Container Profile has been created
  Scenario: Container Profile is deleted from the search results
     When the user clicks on 'Browse'
      And the user clicks on 'Container Profiles'
      And the user filters by text with the Container Profile name
      And the user checks the checkbox of the Container Profile
      And the user clicks on 'Delete'
      And the user clicks on 'Delete Records'
     Then the Container Profile is deleted
  Scenario: Container Profile is deleted from the view page
    Given the user is on the Container Profile view page
     When the user clicks on 'Delete'
      And the user clicks on 'Delete' in the modal
     Then the Container Profiles page is displayed
      And the Container Profile is deleted
  Scenario: Cancel Container Profile delete from the view page
    Given the user is on the Container Profile view page
     When the user clicks on 'Delete'
      And the user clicks on 'Cancel'
     Then the user is still on the Container Profile view page
  Scenario: Container Profile is deleted from the edit page
    Given the user is on the Container Profile edit page
     When the user clicks on 'Delete'
      And the user clicks on 'Delete' in the modal
     Then the Container Profiles page is displayed
      And the Container Profile is deleted
