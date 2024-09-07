Feature: Accessions Search
  Background:
    Given the user is logged in as an administrator
  Scenario: Search accession by title
    Given an accession has been created
    When the user clicks on Browse
    And the user clicks on Accessions
    And the user searches for the accession title
    Then the accession is in the search results
  Scenario: Sort accessions by title
    Given two accessions have been created
    And the accessions are on the search results sorted by ascending title
    When the user clicks on Title
    Then the accessions are sorted by descending title
  Scenario: View accession
    Given an accession has been created
    When the accession is in the search results
    And the user clicks on the View button
    Then the user can view the accession details page
