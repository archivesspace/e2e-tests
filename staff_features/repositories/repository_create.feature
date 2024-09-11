Feature: Repository Create
  Scenario: Repository can be created from an admin user
    Given an administrator user is logged in
     When the user clicks on 'System'
      And the user clicks on 'Manage Repositories'
      And the user clicks on 'Create Repository'
      And the user fills in 'Repository Short Name'
      And the user fills in 'Repository Name'
      And the user clicks on 'Save'
     Then the 'Repository Created' message is displayed
  Scenario: Repository cannot be created from an archivist user
    Given an archivist user is logged in
     When the user clicks on 'System'
     Then the 'Manage Repositories' option is not displayed in the dropdown menu
