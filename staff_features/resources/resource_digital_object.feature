Feature: Resource Digital Object

  Background:
    Given an administrator user is logged in
      And a Resource has been created
      And the Resource is opened in edit mode
  Scenario: Add Digital Object by creating it
     When the user clicks on 'Instances'
      And the user clicks on 'Add Digital Object'
      And the user clicks on the first dropdown in the 'Instances' form
      And the user clicks on 'Create' in the dropdown menu in the 'Instances' form
      And the user fills in 'Title' with 'Test Digital Object' in the modal
      And the user fills in 'Identifier' with 'http://test.idintifier/1234' in the modal
      And the user clicks on 'Create and Link' in the modal
      And the user clicks on 'Save Resource'
     Then the 'Resource' updated message is displayed
      And a new Digital Object is added to the Resource with the following values
       | Title      | Test Digital Object         |
       | Identifier | http://test.idintifier/1234 |
  Scenario: Add Digital Object by browsing it
    Given a Digital Object with the following values is created
      | Title      | Test Digital Object         |
      | Identifier | http://test.identifier/1234 |
     When the user clicks on 'Instances'
      And the user clicks on 'Add Digital Object'
      And the user clicks on the first dropdown in the 'Instances' form
      And the user clicks on 'Browse' in the dropdown menu in the 'Instances' form
      And the user selects the Digital Object with the title 'Test Digital Object' in the modal
      And the user clicks on 'Link' in the modal
      And the user clicks on 'Save Resource'
     Then the 'Resource' updated message is displayed
      And a new Digital Object is added to the Resource with the following values
       | Title      | Test Digital Object         |
       | Identifier | http://test.identifier/1234 |
    