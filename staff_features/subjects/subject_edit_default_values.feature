Feature: Subject Edit Default Values
  Background:
    Given an administrator user is logged in
      And a Subject has been created
      And the user is on the Subjects page
  Scenario: Edit Default Values
     When the user clicks on 'Edit Default Values'
      And the user fills in 'Authority ID' with 'Test ID'
      And the user selects 'Scope Note' from 'Text'
      And the user clicks on 'Save'
     Then the 'Defaults' updated message is displayed
      And the new Subject form has the following default values
       | form_section      | form_field   | form_value |
       | Basic Information | Authority ID | Test ID    |
       | Basic Information | Scope Note   | Text       |
    