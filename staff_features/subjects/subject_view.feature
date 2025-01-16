Feature: Subject View
  Background:
    Given an administrator user is logged in
  Scenario: Search Subject by title
    Given a Subject has been created
     When the user clicks on 'Browse'
      And the user clicks on 'Subjects'
      And the user filters by text with the Subject title
     Then the Subject is in the search results
  Scenario: View Subject from the search results
    Given a Subject has been created
     When the user clicks on 'Browse'
      And the user clicks on 'Subjects'
      And the user filters by text with the Subject title
      And the user clicks on 'View'
     Then the Subject view page is displayed
  Scenario: Sort Subjects by term
    Given two Subjects have been created with a common keyword in their terms
      And the two Subjects are displayed sorted by ascending term
     When the user clicks on 'Term'
     Then the two Subjects are displayed sorted by descending term
  Scenario: Sort Subjects by term type
    Given two subjects have been created with a common keyword in their terms
      And the two Subjects are displayed sorted by ascending term
     When the user clicks on 'Term Type'
     Then the two Subjects are displayed sorted by ascending term type
  Scenario: Sort Subjects by source
    Given two Subjects have been created with a common keyword in their terms
      And the two Subjects are displayed sorted by ascending term
     When the user clicks on 'Source'
     Then the two Subjects are displayed sorted by ascending source
  Scenario: Sort Subjects by created date
    Given two Subjects have been created with a common keyword in their terms
      And the two Subjects are displayed sorted by ascending term
     When the user clicks on 'Sort by' in the dropdown menu
      And the user clicks on 'Ascending' in 'Created' in the dropdown submenu
     Then the two Subjects are displayed sorted by ascending created date
  Scenario: Sort Subjects by modified date
    Given two Subjects have been created with a common keyword in their terms
      And the two Subjects are displayed sorted by ascending term
     When the user clicks on 'Sort by' in the dropdown menu
      And the user clicks on 'Ascending' in 'Modified' in the dropdown submenu
     Then the two Subjects are displayed sorted by ascending modified date
