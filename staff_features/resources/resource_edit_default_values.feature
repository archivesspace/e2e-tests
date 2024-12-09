Feature: Resource Edit Default Values
  Background:
    Given an administrator user is logged in
      And the Pre-populate Records option is activated to My Repository Preferences
      And a Resource has been created
      And the user is on the Resources page
  Scenario: Open Resource Edit Default values page
     When the user clicks on 'Edit Default Values'
      And the user clicks on 'Resources' in the dropdown
     Then the 'Resource Record Defaults' page is displayed
  Scenario: Edit Default Values
    Given the user is on the Resource Record Default page
     When the user fills in 'Title' with 'Test Title'
      And the user selects 'File' from 'Level of Description'
      And the user clicks on 'Save'
     Then the 'Defaults' updated message is displayed
      And the new Resource form has the following values
      | Title                | Test Title |
      | Level of Description | File       |
