Feature: Create repository
  Scenario: Repository is created from an admin user
    Given the user is logged in as an administrator
    When the user clicks on 'System'
    And the user clicks on 'Manage Repositories'
    And the user clicks on 'Create Repository'
    And the user fills in the Repository Short Name
    And the user fills in the Repository Name
    And the user clicks on 'Save'
    Then the 'Repository Created' message is displayed
    And the repository is created
  Scenario: Repository is not created from a view-only user
    Given the user is logged in as a view-only user
    When the user clicks on 'System'
    Then the Manage Repositories button should not be in the dropdown menu
