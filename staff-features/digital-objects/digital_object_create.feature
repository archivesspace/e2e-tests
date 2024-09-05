Feature: Create Digital Object
  Background:
    Given I am logged in as an admin user
  Scenario: Digital object is successfully created
    Given I am on the New Digital Object page
    When I fill in Title with a unique id
    And I fill in Identifier with a unique id
    And I click on Save
    Then a digital object is created
  Scenario: Digital object fails to be created because required fields are missing
    Given I am on the New Digital Object page
    When I click on Save
    Then the following error messages are displayed:
      | Title - Property is required but was missing |
      | Identifier - Property is required but was missing |
    And a digital object is not created
