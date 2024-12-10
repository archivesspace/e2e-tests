Feature: Resource Add Container Instance
  Background:
    Given an administrator user is logged in
      And a Resource has been created
      And the Resource is opened in edit mode
  Scenario: Add container instance
     When the user clicks on 'Instances'
      And the user clicks on 'Add Container Instance'
      And the user selects 'Book' from 'Type'
      And the user clicks on 'Create' in the dropdown menu in the 'Top Container' form
      And the user fills in 'Indicator' in the modal
      And the user clicks on 'Create and Link' in the modal
      And the user clicks on 'Save Resource'
     Then the 'Resource' updated message is displayed
      And the 'Instance' is added in the 'Instances'
