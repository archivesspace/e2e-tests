Feature: Accession Delete
  Background:
    Given I am logged in as an admin user
  Scenario: Delete an accession from the search results
    Given an accession has been created
    And the accession is in the search results
    When I click on the checkbox of the accession
    And I click on Delete
    And I click on Delete Records
    And the message "Records deleted" is displayed
    And the message "No records found" is displayed
  Scenario: Delete an accession from the view page
    Given an accession has been created
    And I am in the accession details page
    When I click on Delete
    And I confirm the delete action
    Then the accession is successfully deleted
  Scenario: Cancel delete from the view page
    Given an accession has been created
    And I am in the accession details page
    When I click on Delete
    When I click on Cancel
    Then the accession is not deleted
