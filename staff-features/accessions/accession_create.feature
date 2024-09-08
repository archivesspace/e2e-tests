Feature: Accession Create
  Background:
    Given an administrator user is logged in
    And the user is on the New Accession page
  Scenario: Accession is created
    When the user fills in Identifier
    And the user clicks on 'Save'
    Then the 'Accession created' message is displayed
  Scenario: Accession is not created because required fields are missing
    When the user clicks on 'Save'
    Then the following error messages are displayed:
      | Identifier - Property is required but was missing  |
