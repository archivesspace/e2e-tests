Feature: Add Event to an Accession
  Background:
    Given an administrator user is logged in
      And an Accession has been created
      And the Accession is opened in edit mode
  Scenario: Accession is opened to Add Event mode
     When the user clicks on 'Add Event'
      And the user selects 'Accession' from the drop down menu
      And the user clicks on 'Add Event' button
     Then the Accession is opened in the Add Event mode
  Scenario: Event type accession is successfully added
    Given the Accession is opened in add event mode
     When the user fills in 'Begin'
      And the user fills in 'Agents'
      And the user fills in 'Role'
      And the user clicks on 'Save'
     Then the 'Event' Created message is displayed
  Scenario: Event type accession is not added
    Given the Accession is opened in Add Event mode
     When the user fills in 'Begin'
      And the user fills in 'Agents'
      And the user fills in 'Role'
      And the user clicks on 'Cancel'
     Then the Event is not created
  Scenario: Add Event fails due to missing required field
    Given the Accession is opened in Add Event mode
     When the user clicks on 'Save'
     Then the following error messages are displayed
       | Expression - is required unless a begin or end date is given |
       | Begin - is required unless an expression or an end date is given |
       | Agents - Property is required but was missing |
       | Role - Property is required but was missing |
