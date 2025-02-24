Feature: Container Profile View
  Background:
    Given an administrator user is logged in
  Scenario: Search Container Profile by name
    Given a Container Profile has been created
     When the user clicks on 'Browse'
      And the user clicks on 'Container Profiles'
      And the user filters by text with the Container Profile name
     Then the Container Profile is in the search results
  Scenario: View Container Profile from the search results
    Given a Container Profile has been created
     When the user clicks on 'Browse'
      And the user clicks on 'Container Profiles'
      And the user filters by text with the Container Profile name
      And the user clicks on 'View'
     Then the Container Profile view page is displayed
  Scenario: Sort Container Profiles by name
    Given two Container Profiles have been created with a common keyword in their name
      And the two Container Profiles are displayed sorted by ascending name
     When the user clicks on 'Name'
     Then the two Container Profiles are displayed sorted by descending name
  Scenario: Container Profiles table download CSV
    Given two Container Profiles have been created with a common keyword in their name
      And the two Container Profiles are displayed in the search results
     When the user clicks on 'Download CSV'
     Then a CSV file is downloaded with the two Container Profiles