Feature: :Location Edit Default Values
  Background:
    Given an administrator user is logged in
      And the Pre-populate Records option is checked in Repository Preferences
      And a Location has been created
      And the user is on the Locations page
  Scenario: Edit Default Values
     When the user clicks on 'Edit Default Values'
      And the user fills in 'Building' with 'Test Building'
      And the user fills in 'Barcode' with '12345678'
      And the user clicks on 'Save Location'
     Then the 'Defaults' updated message is displayed
      And the new Location form has the following default values
       | form_section      | form_field | form_value    |
       | Basic Information | Building   | Test Building |
       | Basic Information | Barcode    | 12345678      |