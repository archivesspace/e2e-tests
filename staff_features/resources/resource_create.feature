Feature: Resource Create

  Background:
    Given an administrator user is logged in

  Scenario: Resource is created
    Given the user is on the New Resource page
     When the user fills in 'Title'
      And the user fills in 'Identifier'
      And the user fills in 'Language'
      And the user fills in 'Expression'
      And the user fills in 'Level of Description'
      And the user fills in 'Language of Description'
      And the user clicks on 'Save'
     Then the 'Resource' created message is displayed
      And the Resource is created
  Scenario: Resource is not created because required fields are missing
    Given the user is on the New Resource page
     When the user clicks on 'Save'
     Then the following error messages are displayed
       | Number - Property is required but was missing                    |
       | Type - Property is required but was missing                      |
       | Expression - is required unless a begin or end date is given     |
       | Begin - is required unless an expression or an end date is given |
       | Title - Property is required but was missing                     |
       | Identifier - Property is required but was missing                |
       | Level of Description - Property is required but was missing      |
       | Language of Description - Property is required but was missing   |
       | Script of Description - Property is required but was missing     |
