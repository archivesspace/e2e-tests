Feature: Accession edit
  Background:
    Given an administrator user is logged in
     And an Accession has been created
  Scenario: Accession is opened in the edit mode from the browse menu
    Given the Accession appears in the search results list
    When the user clicks on 'Edit'
    Then the Accession is opened in the edit mode
     And all fields become editable
  Scenario: Accession is opened in the edit mode from the view mode
    Given the Accession is opened in the view mode
    When the user clicks on 'Edit'
    Then the Accession is opened in the edit mode
     And all fields become editable
  Scenario Outline: Accession is successfully updated
    Given the Accession is opened in edit mode
    When the user changes the <Field> field to <NewValue>
     And the user saves the changes
    Then the Accession is updated with the new <Field> as <NewValue>
     And the 'Accession updated' message is displayed
     And the updated value appears in the accession details
     Examples:
      | Field    | NewValue                 |
      | Title    | Updated Test Accession   |
      | Date     | 2024-10-03               |
  Scenario: Accession is not updated after changes are reverted
    Given the Accession is opened in edit mode
    When the user changes the 'Title' field
     And the user clicks on 'Revert changes'
    Then the Accession is not updated
     And the 'Title' field still shows the original title
  Scenario: Accession update fails due to invalid date input
    Given the Accession is opened in edit mode
    When the user changes the 'Date' field to '2024-13-15'
     And the user saves the changes
    Then the following error message is displayed
      |   Accession Date - Not a valid date  |
     And the Accession is not updated
     And the 'Date' field still shows the original date
  Scenario: Accession update succeeds for User A with a warning for other user editing it
    Given the Accession is opened in edit mode by User A
     And the Accession is also opened in edit mode by User B
    When User A changes the 'Title' field
     And User A saves the changes
    Then the 'Accession updated' message is displayed
     And User A sees the following conflict message
      | This record is currently being edited by another user. Please contact the following users to ensure no conflicts occur: B |
  Scenario: Accession update fails due to concurrent edit by another user
    Given the Accession is opened in edit mode by User A
     And the Accession is also opened in edit mode by User B
    When User A changes the 'Title' field and saves the changes
     And User B changes the 'Title' field and saves the changes
    Then User B sees the following conflict message
      | Failed to save your changes - This record has been updated by another user. Please refresh the page to access the latest version.|
  Scenario: Accession update fails due to missing required field
    Given the Accession is opened in edit mode
    When the user clears the 'Identifier' field
     And the user saves the changes
    Then the following error message is displayed
      | Identifier - Property is required but was missing |
     And the Accession is not updated
  Scenario: User is warned about unsaved changes when navigating away
    Given the Accession is opened in edit mode
    When the user changes the 'Title' field
     And the user attempts to navigate away without saving
    Then a confirmation dialog is displayed asking if the user wants to leave the site with unsaved changes
    When the user chooses to leave the page
    Then the Accession is not updated
