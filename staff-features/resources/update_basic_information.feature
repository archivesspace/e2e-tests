Feature: Update Resource Basic Information
  Background:
    Given the user is logged in as an administrator
    And a resource has been created
  Scenario: Successfully update resource basic information
    Given the user is on the resource edit page
    When the user selects 'Records' from "Resource Type"
    And the user checks 'Publish?'
    And the user checks 'Restrictions Apply?'
    And the user fills in 'Repository Processing Note' with 'VTF #3810'
    And the user clicks on 'Save Resource'
    Then the 'Resource' updated message is displayed
    And the 'Resource Type' has selected value 'Records'
    And the 'Publish?' is checked
    And the 'Restrictions Apply?' is checked
    And the 'Repository Processing Note' has value 'VTF #3810'
  Scenario: Revert changes
    Given the user is on the resource edit page
    When the user changes the resource Title
    And the user changes the resource Identifier
    And the user clicks on 'Revert Changes'
    Then the resource Title does not change
    And the resource Identifier does not change
