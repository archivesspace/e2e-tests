Feature: Agent link to a Digital Object
  Background:
    Given an administrator user is logged in
      And an Agent has been created
      And a Digital Object has been created
      And the Digital Object is opened in the edit mode
  Scenario: Link an agent with required fields
     When the user clicks on 'Add Agent Link' in the 'Agent Links' form
      And the user selects 'Creator' from 'Role'
      And the user searches and selects the Agent in 'Agents'
      And the user clicks on 'Save Digital Object'
     Then the 'Digital Object' updated message is displayed
      And a new Linked Agent is added to the Digital Object
  Scenario: Remove a Linked Agent from a Digital Object
    Given the user has added a Linked Agent to the Digital Object
     When the user clicks on remove icon in the 'Agent Links' form
      And the user clicks on 'Confirm Removal'
      And the user clicks on 'Save Digital Object'
      And the 'Digital Object' updated message is displayed
     Then the Linked Agent is removed from the Digital Object
