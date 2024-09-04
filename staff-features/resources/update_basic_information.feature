Feature: Update Resource Basic Information
  Background:
    Given I am logged in as an admin user
    Given a resource has been created
  Scenario: Successfully update resource basic information
    Given I am on the resource edit page
    When I select "Records" from "Resource Type"
    When I check Publish?
    When I check Restrictions Apply?
    When I fill in Repository Processing Note with "Repository Processing Note"
    When I click on Save Resource
    Then the resource is successfully updated
    Then Resource Type has value Records
    Then Publish? is checked
    Then Restrictions Apply? is checked
    Then Repository Processing Note has value "Repository Processing Note"
  Scenario: Revert changes
    Given I am on the resource edit page
    When I change the resource Title
    When I change the resource Identifier
    When I click on Revert Changes
    Then the resource Title does not change
    Then the resource Identifier does not change
