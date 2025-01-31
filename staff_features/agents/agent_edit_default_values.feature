Feature: Agent Edit Default Values
  Background:
    Given an administrator user is logged in
      And the Pre-populate Records option is checked in Repository Preferences
      And an Agent type Person has been created
      And an Agent type Family has been created
      And an Agent type Corporate Entity has been created
      And an Agent type Software has been created
      And the user is on the Agents page
  Scenario: Edit Default Values of Agent type Person
     When the user clicks on 'Edit Default Values'
      And the user clicks on 'Person' in the dropdown menu
      And the user clicks on 'Name Forms'
      And the user clicks on 'Add Name Form'
      And the user fills in 'Primary Part of Name' with 'Test name'
      And the user fills in 'Rest of Name' with 'Rest name'
      And the user clicks on 'Save Person'
     Then the 'Defaults' updated message is displayed
      And the new Agent type Person form has the following default values
       | form_section | form_field           | form_value |
       | Name Forms   | Primary Part of Name | Test name  |
       | Name Forms   | Rest of Name         | Rest name  |
  Scenario: Edit Default Values of Agent type Family
     When the user clicks on 'Edit Default Values'
      And the user clicks on 'Family' in the dropdown menu
      And the user clicks on 'Notes'
      And the user clicks on 'Add Note'
      And the user selects 'General Context' from 'Note Type'
      And the user fills in 'Content' with 'Test note'
      And the user clicks on 'Save Family'
     Then the 'Defaults' updated message is displayed
      And the new Agent type Family form has the following default values
       | form_section | form_field | form_value      |
       | Notes        | Note Type  | General Context |
       | Notes        | Content    | Test note       |
  Scenario: Edit Default Values of Agent type Corporate Entity
     When the user clicks on 'Edit Default Values'
      And the user clicks on 'Corporate Entity' in the dropdown menu
      And the user clicks on 'Other Agency Codes'
      And the user clicks on 'Add Agency Code'
      And the user fills in 'Maintenance Agency' with 'Test Agency'
      And the user clicks on 'Save Corporate Entity'
     Then the 'Defaults' updated message is displayed
      And the new Agent type Corporate Entity form has the following default values
       | form_section       | form_field         | form_value  |
       | Other Agency Codes | Maintenance Agency | Test Agency |
  Scenario: Edit Default Values of Agent type Software
     When the user clicks on 'Edit Default Values'
      And the user clicks on 'Software' in the dropdown menu
      And the user clicks on 'Contact Details'
      And the user clicks on 'Add Contact'
      And the user fills in 'Contact Name' with 'Test Contact'
      And the user clicks on 'Save Software'
     Then the 'Defaults' updated message is displayed
      And the new Agent type Corporate Entity form has the following default values
       | form_section    | form_field   | form_value   |
       | Contact Details | Contact Name | Test Contact |
    