Feature: Repository management - Create repository

  Scenario: Successfully create a repository
    Given I am logged in as an admin user
    When I click on "System"
    And I click on "Manage Repositories"
    And I click on "Create Repository"
    And I fill in the Repository Short Name
    And I fill in the Repository Name
    And I click on "Save"
    Then the message "Repository Created" is displayed
    And the new repository should be appeared in the list of repositories

  Scenario: View-only user cannot create a repository
    Given I am signed in as a view-only user
    When I click on "System"
    Then the Manage Repositories button should not be present in the dropdown menu
