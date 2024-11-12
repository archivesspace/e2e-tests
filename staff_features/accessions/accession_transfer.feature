Feature: Accession transfer to another Repository
  Background:
   Given an administrator user is logged in
     And an Accession has been created
     And a Repository has been created
     And the Accession is opened in edit mode
  Scenario: Accession is transferred to another Repository
    When the user clicks on 'Transfer' button on the toolbar
     And the user selects the destination Repository from the drop-down list
     And the user clicks on 'Transfer' button
     And the user clicks on 'Transfer' button at the modal
    Then the following message is displayed
      | Transfer Successful. Records may take a moment to appear in the target repository while re-indexing takes place. |
