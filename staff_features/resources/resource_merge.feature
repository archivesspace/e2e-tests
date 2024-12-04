Feature: Resource merge
  Background:
    Given an administrator user is logged in
      And two Resources have been created
  Scenario: Merge two Resources by browsing
    Given the first Resource is opened in edit mode
     When the user clicks on 'Merge'
      And the user clicks on the dropdown in the merge dropdown form
      And the user clicks on 'Browse' in the merge dropdown form
      And the user filters by text with the second Resource title in the modal
      And the user selects the second Resource from the search results in the modal
      And the user clicks on 'Link' in the modal
      And the user clicks on 'Merge' in the merge dropdown form
      And the user clicks on 'Merge' in the modal
     Then the 'Resource(s)' merged message is displayed
      And the second Resource is deleted
      And the following linked records from the second Resource are appended to the first Resource
        | Related Accessions |
        | Agent Links        |
        | Subjects           |
        | Classifications    |
  Scenario: Merge two Resources by searching
    Given the first Resource is opened in edit mode
     When the user clicks on 'Merge'
      And the user fills in and selects the second Resource in the merge dropdown form
      And the user clicks on 'Merge' in the merge dropdown form
      And the user clicks on 'Merge' in the modal
     Then the 'Resource(s)' merged message is displayed
      And the second Resource is deleted
      And the following linked records from the second Resource are appended to the first Resource
        | Related Accessions |
        | Agent Links        |
        | Subjects           |
        | Classifications    |
