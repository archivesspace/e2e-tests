Feature: Accession Create
  Background:
    Given the user is logged in as an administrator
  Scenario: Accession is created
    Given the user is on the New Accession page
    When the user fills in Identifier
    And the user clicks on 'Save'
    Then the message "Accession created" is displayed
  Scenario: Accession is not created
    Given the user is on the New Accession page
    When the user clicks on 'Save'
    Then the following error messages are displayed:
      | Identifier - Property is required but was missing  |
