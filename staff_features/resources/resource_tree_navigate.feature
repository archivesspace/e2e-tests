Feature: Navigating a Resource Record Tree
  Background:
    Given an administrator user is logged in
      And a Resource has been created
      And 2 Archival Objects attached to the Resource record have been created
  Scenario: Viewing the Resource Record tree
     When the Resource is opened in edit mode
     Then the Resource Record is displayed as the top level of the navigation tree
      And the tree includes the 2 attached Archival Object Records
      And the current record is highlighted in the tree
  Scenario: Expanding all levels of the tree
    Given the Resource Record tree is displayed
     When the user clicks on 'Auto-Expand All'
     Then all files of Archival Objects are displayed
      And the button has the label 'Disable Auto-Expand'
      And the expand arrow is disabled
  Scenario: Disabling auto-expand
    Given all levels of hierarchy in the tree are expanded
     When the user clicks on 'Disable Auto-Expand'
     Then the button has the label 'Auto-Expand All'
      And the expand arrow is enabled
      And all sections remain expanded until manually collapsed
  Scenario: Collapsing all levels of the tree
    Given the Resource Record tree is displayed
     When the user clicks on 'Collapse Tree'
     Then the Resource Record and its top-level Archival Object Records are displayed
