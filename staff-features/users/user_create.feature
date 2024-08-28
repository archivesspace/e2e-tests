Feature: User Management - Create User
  Background:
    Given I am logged in as an admin user
  Scenario: User is successfully created
    Given I am on the Manage Users page
    When I click on "Create User"
    And I fill in the Username
    And I fill in the Full name
    And I fill in the Password
    And I fill in the Confirm password
    And I click on "Create Account"
    Then the message "User Created" is displayed
    And the new user should appear in the search results
  Scenario: Fail to create a user due to missing required fields
    Given I am on the Manage Users page
    When I click on "Create User"
    And I click on "Create Account"
    Then the system should display the following error messages:
      | Username - can't be empty |
      | Full name - Property is required but was missing |
      | Password - can't be empty |
      | Confirm password - can't be empty |
      | User not created |
