Feature: Resource Spawn from an Accession
  Background:
   Given an administrator user is logged in
    And an Accession has been created
    And the Accession with the title "Original Accession Title" is opened in edit mode

  Scenario: Resource Spawn from Accession page is opened
    When the user clicks on 'Spawn'
     And the user clicks on 'Resource' in the spawn dropdown menu
    Then the New Resource page is displayed
     And the following info message is displayed
      | A new Resource has been spawned from Accession "Original Accession Title". This record is unsaved. You must click Save for the record to be created in the system. |

  Scenario: Original Accession record is linked to the spawned Resource
    Given the user is on the New Resource page spawned from the original Accession
     When the user click on 'Related Accessions' at the sidebar
     Then the 'Related Accessions' form is displayed
      And the original Accession Title is filled in

  Scenario: Backing out of creating a resource record
    Given the user is on the New Resource page spawned from the original Accession
     When the user clicks on the 'Return to Accession' button
     Then the original Accession Record page is displayed