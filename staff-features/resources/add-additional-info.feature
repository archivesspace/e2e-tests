Feature: Resources management - Add additional information
  Background:
    Given I am signed in as administrator
    And I am in the edit mode of a resource record

  Scenario: Successfully add additional information about resource type by clicking on the Save button in the toolbar
    When I click on "Basic Information" in the left sidebar
    And I select "Records" from the "Resource Type" dropdown menu in the basic information section
    And I click on the "Save" button in the resource toolbar
    Then the additional information is added
    And the message "Resource <name of resource> updated" is displayed

  Scenario: Successfully add additional information about publishing by clicking on the Save button at the bottom of the sidebar
    When I click on "Basic Information" in the left sidebar
    And I check the "Publish" checkbox in the basic information section
    And I click on the "Save" button at the bottom of the sidebar
    Then the additional information is added
    And the message "Resource <name of resource> updated" is displayed

  Scenario: Discard changes by clicking on the Revert Changes button
    When I click on "Basic Information" in the left sidebar
    And I check the "Restrictions apply" checkbox in the basic information section
    And I click on the "Revert Changes" button in the resource toolbar
    Then the additional information has not been added
    And the "Revert Changes" button disappears