Feature: Create Multiple Resource Component Records using the Rapid Data Entry (RDE) Tool
  Background:
    Given an administrator user is logged in
      And a Resource has been created
      And the Resource is opened in edit mode
  Scenario: Open Rapid Data Entry tool
     When the user clicks on 'Rapid Data Entry'
     Then the 'Rapid Data Entry' tool is displayed
  Scenario: Add a new resource component row with valid data
    Given the 'Rapid Data Entry' tool is displayed
     When the user selects 'File' from 'Level of Description'
      And the user fills in 'Title' with 'Default Test Title'
      And the user selects 'Bulk Dates' from 'Date Type'
      And the user fills in 'Begin' with '2021'
      And the user clicks on 'Add Row'
     Then a new row with the following data is added to the RDE tool
       | form_field           | form_value         |
       | Level of Description | File               |
       | Title                | Default Test Title |
       | Date Type            | Bulk Dates         |
       | Begin                | 2021               |
