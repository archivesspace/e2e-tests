Feature: Archival Object Spawn from an Accession
  Background:
    Given an administrator user is logged in
      And an Accession has been created
      And the Accession with the title "Original Accession Title" is opened in edit mode
  Scenario: Archival Object Spawn from Accession page is opened
     When the user clicks on 'Spawn'
      And the user clicks on 'Archival Object' in the spawn dropdown menu
      And the user selects Resource at the dialog modal
      And the user selects Component Position at the dialog modal
      And the user selects an option in the pop up window
     Then the New Archival Object page is displayed
      And the following info message is displayed
      | This Archival Object has been spawned from Accession . This record is unsaved. You must click Save for the record to be created in the system. |
  Scenario: Original Accession record is linked to the spawned Archival Object
    Given the user is on the New Archival Object page spawned from the original Accession
     When the user clicks on 'Accession Links' at the sidebar
     Then the 'Accession Links' form is displayed
      And the original Accession Title is filled in
  Scenario: Confirm Data Transfer to Spawned Archival Object
    Given the user has spawned an Archival Object from an Accession record
     When the user views the details of the new Archival Object
     Then the user should see the following data fields populated with information from the original Accession record:
      | Title                         |
      | Publish value                 |
      | Language                      |
      | Language script               |
      | Language of Materials note    |
      | Dates                         |
      | Extents                       |
      | Related Accessions            |
      | Agent links                   |
      | Subjects                      |
      | Content description           |
      | Condition description         |
      | Rights Statements             |
      | Metadata Rights Declarations  |
      | Classifications               |
     And any repository default values should be applied if configured

