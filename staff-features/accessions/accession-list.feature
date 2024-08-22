Feature: Accession List
  Background:
    Given I am signed in as a system administrator

  Scenario: Show accession list
    When I click on "Browse"
    And I click on "Accessions"
    Then the accession list is displayed

  Scenario: Sort accession list by descending title when clicking on Title
    Given I have opened the "Accessions" page
    When I click on "Title"
    Then the accession list is sorted by descending title
    And The "Sort by" block at the headline of the records table shows "Title Descending"
    And The URL contains "?sort=title_sort+desc"

  Scenario: View an accession in the non-editable view
    Given I have opened "Accessions"
    When I click the "View" button at the right of the accession record in the list
    Then the accession is shown in a non-editable view
    And the sidebar should be visible