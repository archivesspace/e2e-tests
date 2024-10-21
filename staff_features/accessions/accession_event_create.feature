Feature: Accession Event Create
  Background:
    Given an administrator user is logged in
      And an Accession has been created
      And the Accession is opened in edit mode
  Scenario: Accession Event create page
     When the user clicks on 'Add Event'
      And the user clicks on 'Add Event' again
     Then the New Event page is displayed with the Accession linked
  Scenario: Accession Event is created
    Given the New Event page is open for an Accession
     When the user fills in 'Begin' with '2020-01-01'
      And the user links an Agent
      And the user clicks on 'Save'
     Then the 'Event Created' message is displayed
  Scenario: Accession Event is not created due to missing all required fields
    Given the New Event page is open for an Accession
     When the user clicks on 'Save'
     Then the following error messages are displayed
       | Expression - is required unless a begin or end date is given |
       | Begin - is required unless an expression or an end date is given |
       | Agents - Property is required but was missing |
       | Role - Property is required but was missing |
  Scenario: Accession Event is not created due to missing required fields - only 'Expression' is completed
    Given the New Event page is open for an Accession
     When the user fills in 'Expression'
      And the user clicks on 'Save'
     Then the following error messages are displayed
      | Agents - Property is required but was missing |
      | Role - Property is required but was missing |
  Scenario: Accession Event is not created due to invalid date format
    Given the New Event page is open for an Accession
     When the user fills in 'Begin' with '2024-13-15'
      And the user links an Agent
      And the user clicks on 'Save'
    Then the following error message is displayed
      | Begin - Not a valid date |
