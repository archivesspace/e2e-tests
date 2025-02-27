Feature: Location Edit Batch
  Background:
    Given an administrator user is logged in
      And Locations A & B have been created
      And the user is on the Locations page
  Scenario: Edit Batch
     When the user checks the checkboxes of A and B locations
      And the user clicks on 'Edit Batch'
      And the user clicks on 'Edit Records' in the modal
      And the user fills in 'Building' with 'Test Batch Building'
      And the user clicks on 'Update Locations'
     Then the 'Locations' updated message is displayed
      And the Locations A & B have the following values
       | form_section      | form_field | form_value    |
       | Basic Information | Building   | Test Batch Building |