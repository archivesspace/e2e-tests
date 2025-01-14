Feature: Digital Object Component Reorder
  Background:
    Given an administrator user is logged in
      And a Digital Object with 2 Digital Object Components has been created
      And the Digital Object is opened in edit mode
  Scenario: Activate reorder mode
     When the user clicks on 'Enable Reorder Mode'
     Then button turns green
      And the button has text 'Disable Reorder Mode'
  Scenario: Cut and Paste a Digital Object Component
     When the user selects a Digital Object Component
      And the user clicks on 'Cut'
      And the user clicks on the component that represents the desired position in the tree
      And the user clicks on 'Paste'
     Then the component is pasted as a child of the selected component
  Scenario: Move a Digital Object Component Up a Level
    Given a Digital Object Component has a child
     When the user selects the child Digital Object Component
      And the user clicks on 'Move'
      And the user clicks on 'Up a Level' in the dropdown menu
     Then the selected Digital Object Component moves a level up
  Scenario: Move Up a Digital Object Component
     When the user selects a Digital Object Component
      And the user clicks on 'Move'
      And the user clicks on 'Up' in the dropdown menu
     Then the Digital Object Component moves one position up
  Scenario: Move Down Into a Digital Object Component
     When the user selects a Digital Object Component
      And the user clicks on 'Move'
      And the user clicks on 'Down Into' in the dropdown menu
      And the user selects a Digital Object Component from the dropdown menu
     Then the Digital Object Component moves as a child into the selected Digital Object Component
