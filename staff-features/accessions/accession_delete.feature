Feature: Accession Delete
  Background:
    Given the user is logged in as an administrator
  Scenario: Accession is deleted from the search results
    Given an accession has been created
    And the accession is in the search results
    When the user clicks on the checkbox of the accession
    And the user clicks on 'Delete'
    And the user clicks on 'Delete Records'
    And the 'Records deleted' message is displayed
    And the 'No records found' message is displayed
  Scenario: Accession is deleted from the view page
    Given an accession has been created
    And the user is on the accession details page
    When the user clicks on 'Delete'
    And the user confirms the delete action
    Then the accession is deleted
  Scenario: Cancel accession delete from the view page
    Given an accession has been created
    And the user is on the accession details page
    When the user clicks on 'Delete'
    When the user clicks on 'Cancel'
    Then the accession is not deleted
