Feature: Top Container View
  Background:
    Given an administrator user is logged in
    And a Resource with a Top Container has been created
  Scenario: View Top Container from the search results
    Given the user is on the Top Containers page
     When the user fills in 'Keyword' with the Resource title
      And the user clicks on 'View'
     Then the Top Container view page is displayed
  Scenario: View Top Container from the container instance
    Given the user is on the Resource view page
     When the user clicks on 'Instances'
      And the user clicks on 'Top Container'
      And the user clicks on 'View' in the dropdown menu
     Then the Top Container view page is displayed
