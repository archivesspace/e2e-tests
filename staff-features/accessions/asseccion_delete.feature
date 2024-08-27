Feature: Accession Management - Deleting Accession Records
  Background:
    Given I am signed in as a system administrator

  Scenario: Successfully delete an entire accession record from the accession list
    Given I am on the "Accessions" page
    When I click on the checkbox to select the record
    And I click on the red "Delete" button in the upper right corner
    And I click on the "Delete records" button in the warning dialog
    Then the alert "Records deleted" is shown
    And the record is no longer shown in the list

  Scenario: Cancel deletion of an accession record from the toolbar in view mode
    Given I am in view mode of an accession record
    When I click on the red "Delete" button on the accession record toolbar
    And I click on the "Cancel" button in the warning dialog
    Then the accession record is not deleted
    And it remains shown in the list

  Scenario: Successfully delete an entire accession record from the toolbar in view mode
    Given I am in view mode of an accession record
    When I click on the red "Delete" button on the accession record toolbar
    And I click on the "Delete records" button in the warning dialog
    Then the alert "Records deleted" is shown
    And it is no longer shown in the list