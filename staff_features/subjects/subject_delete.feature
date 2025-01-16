Feature: Subject Delete
  Background:
    Given an administrator user is logged in
      And a Subject has been created
  Scenario: Subject is deleted from the search results
     When the user clicks on 'Browse'
      And the user clicks on 'Subjects'
      And the user filters by text with the Subject term
      And the user checks the checkbox of the Subject
      And the user clicks on 'Delete'
      And the user clicks on 'Delete Records'
     Then the 'Records' deleted message is displayed
      And the Subject is deleted
  Scenario: Subject is deleted from the view page
    Given the user is on the Subject view page
     When the user clicks on 'Delete'
      And the user clicks on 'Delete' in the modal
     Then the Subjects page is displayed
      And the 'Subject' deleted message is displayed
      And the Subject is deleted
  Scenario: Cancel Subject delete from the view page
    Given the user is on the Subject view page
     When the user clicks on 'Delete'
      And the user clicks on 'Cancel'
     Then the user is still on the Subject view page
