Feature: Subject Edit
  Background:
    Given an administrator user is logged in
      And a Subject has been created
  Scenario: Subject is opened in the edit mode from the browse menu
    Given the Subject appears in the search results list
     When the user clicks on 'Edit'
     Then the Subject is opened in the edit mode
  Scenario: Subject is opened in the edit mode from the view mode
    Given the Subject is opened in the view mode
     When the user clicks on 'Edit'
     Then the Subject is opened in the edit mode
  Scenario Outline: Subject is successfully updated
    Given the Subject is opened in edit mode
     When the user changes the '<Field>' field to '<NewValue>'
      And the user clicks on 'Save'
     Then the 'Subject' updated message is displayed
     Then the field '<Field>' has value '<NewValue>'
      Examples:
       | Field        | NewValue          |
       | Authority ID | Test Authority ID |
       | Scope Note   | Test Scope Note   |
  Scenario: Subject is not updated after changes are reverted
    Given the Subject is opened in edit mode
     When the user changes the 'Term' field
      And the user clicks on 'Revert Changes'
     Then the Subject Term field has the original value
  Scenario: Delete required sub-record of a Subject fails
    Given the Subject is opened in edit mode
     When the user selects 'empty Source' from 'Source' in the 'Besic Information' form
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Source - Property is required but was missing |
  Scenario: Delete sub-record of a Subject
    Given the Subject is opened in edit mode
      And the Subject has one Metadata Rights Declarations
     When the user clicks on remove icon in the 'Metadata Rights Declarations' form
      And the user clicks on 'Confirm Removal'
      And the user clicks on 'Save'
     Then the 'Subject' updated message is displayed
      And the Subject does not have Metadata Rights Declarations
