Feature: Accessions Search
  Background:
    Given I am logged in as an admin user

  Scenario: Search accession by title
    Given an accession has been created
    When I click on "Browse"
    And I click on "Accessions"
    And I search for the accession title
    Then the accession is in the search results

  Scenario: Sort accessions by title
    Given two accessions have been created
    And the accessions are on the search results sorted by ascending title
    When I click on "Title"
    Then the accessions are sorted by descending title

  Scenario: View accession
    Given an accession has been created
    When the accession is in the search results
    And I click on the View button
    Then I can view the accession details page
