Feature: Digital Object Management - Create Digital Object Record

  Background:
    Given I am signed in as a system administrator
    And I am in the edit mode of an accession record
    When I click on "Instances" in the left sidebar
    And I click on "Add Digital Object" in the sub-record form
    And I click on the dropdown toggle to the right of the input field
    And I click on "Create"

  Scenario: Successfully create and link a digital object record
    When I fill in the "Title" field
    And I fill in the "Identifier" field
    And I click on the "Create and Link" button
    And I click on the "Save Accession" button
    Then the digital object record is created
    And the digital object is linked to the accession record
    And "+1" is added next to "Instances" in the left sidebar

  Scenario: Fail to create a digital object record due to missing required information
    When I click on the "Create and Link" button without filling in the required fields
    Then the digital object record is not created
    And an alert is shown with the following errors:
      | Title - Property is required but was missing |
      | Identifier - Property is required but was missing |