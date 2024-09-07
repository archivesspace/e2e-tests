Feature: Accession Create
  Background:
    Given the user is logged in as an administrator
  Scenario: Accession is created
    Given the user is on the New Accession page
    When the user fills in all the required fields
    When the user clicks on Save
    Then a new accession is created
  Scenario: Accession is not created
    Given the user is on the New Accession page
    When the user does not fill in all the required fields
    When the user clicks on Save
    Then a new accession is not created
