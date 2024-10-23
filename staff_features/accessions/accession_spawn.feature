Feature: Accession Spawn
  Background:
    Given an administrator user is logged in
      And an Accession has been created
      And the Accession is opened in edit mode
  Scenario: Accession Spawn Accession page is opened
     When the user clicks on 'Spawn'
      And the user clicks on 'Accession' in the spawn dropdown menu
     Then the New Accession page is displayed
      And the following info message is displayed
        |This Accession has been spawned from Accession . This record is unsaved. You must click Save for the record to be created in the system.|
      And the 'This Accession has been spawned from Accession . This record is unsaved. You must click Save for the record to be created in the system.' message is displayed
  Scenario: Successfully spawn a new accession record from an existing accession record - non linked
    Given the user is on the New Accession page spawned from the original Accession
     When the user fills in 'Identifier'
      And the user clicks on 'Save'
     Then the Accession is created
      And the new Accession is not linked to the original Accession
  Scenario: Successfully spawn a new accession record from an existing accession record - linked
    Given the user is on the New Accession page spawned from the original Accession
     When the user fills in 'Identifier'
      And the user links to the original Accession in the 'Related Accessions' form
      And the user clicks on 'Save'
     Then the Accession is created
      And the new Accession is linked to the original Accession
  Scenario: Accession is not created due to missing required fields
    Given the user is on the New Accession page spawned from the original Accession
     When the user clicks on 'Save'
     Then the following error message is displayed
       | Identifier - Property is required but was missing |
