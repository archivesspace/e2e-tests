Feature: Create Digital Object
  Background:
    Given the user is logged in as an administrator
  Scenario: Digital Object is created
    Given the user is on the New Digital Object page
    When the user fills in Title with a unique id
    And the user fills in Identifier with a unique id
    And the user clicks on 'Save'
    Then the digital object is created
  Scenario: Digital Object is not created because required fields are missing
    Given the user is on the New Digital Object page
    When the user clicks on 'Save'
    Then the following error messages are displayed:
      | Title - Property is required but was missing |
      | Identifier - Property is required but was missing |
    And the digital object is not created
