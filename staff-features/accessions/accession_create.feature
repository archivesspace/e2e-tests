Feature: Accession Create
  Background:
    Given I am logged in as an admin user
  Scenario: Accession is created
    Given I am on the New Accession page
    When the user fills in all the required fields
    When the user clicks on Save
    Then a new accession is created
  Scenario: Accession is not created
    Given I am on the New Accession page
    When the user does not fill in all the required fields
    When the user clicks on Save
    Then a new accession is not created
