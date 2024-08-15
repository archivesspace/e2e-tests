Feature: User Management - Create User

  Background:
    Given I am logged in as an admin
    And I navigate to the "System" section
    And I click on "Manage Users"

  Scenario: User is successfully created
    When I click on "Create User"
    And I type a "Username"
    And I type a "Full name"
    And I type a "Password"
    And I retype the password in the "Confirm password" field
    And I click on the "Create Account" button
    Then the user should be created, and a success alert "User Created: test abc" should be shown
    And the new user should appear in the list of user records in the repository

  Scenario: Fail to create a user due to missing required fields
    When I click on "Create User"
    And I do not fill in the "Username", "Full name", "Password", and "Confirm password" fields
    And I click on the "Create Account" button
    Then the system should display the following error messages:
      | "Username - can't be empty"                    |
      | "Full name - Property is required but missing" |
      | "Password - can't be empty"                    |
      | "Confirm password - can't be empty"            |
      | "Confirm password - Entered value didn't match password" |