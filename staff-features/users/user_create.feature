Feature: Create User
  Background:
    Given the user is logged in as an administrator
  Scenario: User is created
    Given the user is on the Manage Users page
    When the user clicks on 'Create User'
    And the user fills in the Username
    And the user fills in the Full name
    And the user fills in the Password
    And the user fills in the Confirm password
    And the user clicks on 'Create Account'
    Then the message "User Created" is displayed
    And the new user should appear in the search results
  Scenario: User is not created because required fields are missing
    Given the user is on the Manage Users page
    When the user clicks on 'Create User'
    And the user clicks on 'Create Account'
    Then the following error messages are displayed:
      | Username - can't be empty |
      | Full name - Property is required but was missing |
      | Password - can't be empty |
      | Confirm password - can't be empty |
      | User not created |
