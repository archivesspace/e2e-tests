Feature: Location Profile View
  Background:
    Given an administrator user is logged in
  Scenario: Search Location Profile by title
    Given a Location Profile has been created
     When the user clicks on 'System'
      And the user clicks on 'Manage Location Profiles' in the dropdown menu
      And the user filters by text with the Location Profile title
     Then the Location Profile is in the search results
  Scenario: View Location Profile from the search results
    Given a Location Profile been created
     When the user clicks on 'System'
      And the user clicks on 'Manage Location Profiles' in the dropdown menu
      And the user filters by text with the Location Profile title
      And the user clicks on 'View'
     Then the Location Profile view page is displayed
  Scenario: Sort Location Profiles by title
    Given two Location Profiles have been created with a common keyword in their title
      And the two Location Profiles are displayed sorted by ascending title
     When the user clicks on 'Title'
     Then the two Location Profiles are displayed sorted by descending title
  Scenario: Location Profiles table download CSV
    Given two Location Profiles have been created with a common keyword in their title
      And the two Location Profiles are displayed in the search results
     When the user clicks on 'Download CSV'
     Then a CSV file is downloaded with the the two Location Profiles