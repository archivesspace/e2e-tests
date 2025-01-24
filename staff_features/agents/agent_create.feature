Feature: Agent Create
  Background:
    Given an administrator user is logged in
      And the user is on Agents page
      And the user clicks on 'Create Agent'
  Scenario: Agent type Person is created
     When the user clicks on 'Person' in the dropdown menu
      And the user fills in 'Primary Part of Name' with 'Person Agent' in the 'Name Forms' form
      And the user clicks on 'Save'
     Then the 'Agent' created message is displayed
      And the user is on the agent_person edit page
  Scenario: Agent type Person is not created because required fields are missing
     When the user clicks on 'Person' in the dropdown menu
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Primary Part of Name - Property is required but was missing |
  Scenario: Agent type Family is created
     When the user clicks on 'Family' in the dropdown menu
      And the user fills in 'Family Name' with 'Family Agent' in the 'Name Forms' form
      And the user clicks on 'Save'
     Then the 'Agent' created message is displayed
      And the user is on the agent_family edit page
  Scenario: Agent type Family is not created because required fields are missing
     When the user clicks on 'Family' in the dropdown menu
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Family Name - Property is required but was missing |
  Scenario: Agent type Corporate Entity is created
     When the user clicks on 'Corporate Entity' in the dropdown menu
      And the user fills in 'Primary Part of Name' with 'Corporate Agent' in the 'Name Forms' form
      And the user clicks on 'Save'
     Then the 'Agent' created message is displayed
      And the user is on the agent_corporate_entity edit page
  Scenario: Agent type Corporate Entity is not created because required fields are missing
     When the user clicks on 'Corporate Entity' in the dropdown menu
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Primary Part of Name - Property is required but was missing |
  Scenario: Agent type Software is created
     When the user clicks on 'Software' in the dropdown menu
      And the user fills in 'Software Name' with 'Software Agent' in the 'Name Forms' form
      And the user clicks on 'Save'
     Then the 'Agent' created message is displayed
      And the user is on the agent_software edit page
  Scenario: Agent type Software is not created because required fields are missing
     When the user clicks on 'Software' in the dropdown menu
      And the user clicks on 'Save'
     Then the following error messages are displayed
       | Software Name - Property is required but was missing |
    