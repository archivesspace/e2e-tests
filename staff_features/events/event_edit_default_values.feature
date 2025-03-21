Feature: Event Edit Default Values
  Background:
    Given an administrator user is logged in
      And the Pre-populate Records option is checked in Repository Preferences
      And an Event has been created
      And the user is on the Events page
  Scenario: Edit Default Values
     When the user clicks on 'Edit Default Values'
      And the user fills in 'Title' with 'Test Digital Object'
      And the user selects 'Collection' from 'Type'
      And the user fills in 'Outcome Note' with 'Test Note'
      And the user clicks on 'Save'
     Then the 'Defaults' updated message is displayed
      And the new Event form has the following default values
       | form_section      | form_field   | form_value |
       | Basic Information | Type         | Collection |
       | Basic Information | Outcome Note | Test Note  |