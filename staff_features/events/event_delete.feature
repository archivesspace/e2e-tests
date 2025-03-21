Feature: Event Delete
  Background:
    Given an administrator user is logged in
      And an Event has been created
  Scenario: Event is deleted from the view page
    Given the user is on the Event view page
     When the user clicks on 'Delete'
      And the user clicks on 'Delete' in the modal
     Then the Events page is displayed
      And the 'Event' deleted message is displayed
      And the Event is deleted
  Scenario: Cancel Event delete from the view page
    Given the user is on the Event view page
     When the user clicks on 'Delete'
      And the user clicks on 'Cancel'
     Then the user is still on the Event view page
  Scenario: Event is deleted from the edit page
    Given the user is on the Event edit page
     When the user clicks on 'Delete'
      And the user clicks on 'Delete' in the modal
     Then the Events page is displayed
      And the 'Event' deleted message is displayed
      And the Event is deleted