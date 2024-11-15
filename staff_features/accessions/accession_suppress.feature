Feature: Accession Suppress
  Background:
    Given an administrator user is logged in
      And an Accession has been created
      And the Accession is opened in edit mode
  Scenario: Accession is suppressed
    Given the Accession is not suppressed
     When the user clicks on 'Suppress'
      And the user clicks on 'Suppress' in the confirm popup
     Then the Accession is suppressed
      And the record should be hidden from non-authorized users
      And the following info messages are displayed
       | Accession suppressed                         |
       | Accession is suppressed and cannot be edited |
  Scenario: Accession is unsuppressed
    Given the Accession is suppressed
     When the user clicks on 'Unsuppress'
      And the user clicks on 'Unsuppress' in the confirm popup
     Then the Accession is unsuppressed
      And the record should be visible to all authorized users
      And only the following info message is displayed
       | Accession unsuppressed                         |
