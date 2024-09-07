Feature: Update Resource Basic Information
  Background:
    Given the user is logged in as an administrator
    Given a resource has been created
  Scenario: Successfully update resource basic information
    Given the user is on the resource edit page
    When the user selects "Records" from "Resource Type"
    When the user checks Publish?
    When the user checks Restrictions Apply?
    When the user fills in Repository Processing Note with "Repository Processing Note"
    When the user clicks on 'Save Resource'
    Then the resource is updated
    Then Resource Type has value Records
    Then Publish? is checked
    Then Restrictions Apply? is checked
    Then Repository Processing Note has value "Repository Processing Note"
  Scenario: Revert changes
    Given the user is on the resource edit page
    When the user changes the resource Title
    When the user changes the resource Identifier
    When the user clicks on 'Revert Changes'
    Then the resource Title does not change
    Then the resource Identifier does not change
