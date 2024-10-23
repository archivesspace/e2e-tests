Feature: Spawning a new accession record from an existing accession record
  Background:
    Given an administrator user is logged in
     And an Accession has been created
     And the Accession is opened in edit mode
  Scenario: Accession Spawn Accession page is opened
    When the user clicks on 'Spawn'
      And the user clicks on 'Accession' in the dropdown menu
     Then the New Accession page is opened
      And the 'This Accession has been spawned from Accession . This record is unsaved. You must click Save for the record to be created in the system.' message is displayed
  Scenario: Successfully spawn a new accession record from an existing accession record - non linked
    Given the user is on the New Accession page spawned from the original accession
     When the user fills in 'Identifier' with a unique identifier
      And the user does not add any links to the original accession in the 'Related Accessions' form
      And the user clicks on 'Save'
     Then the Accession is created
      And the new accession record is not linked to the original accession
  Scenario: Successfully spawn a new accession record from an existing accession record - linked
    Given the user is on the New Accession page spawned from the original accession
     When the user fills in 'Identifier' with a unique identifier
      And the user adds links to the original accession in the 'Related Accessions' form
      And the user clicks on 'Save'
     Then the Accession is created
      And the new accession record is linked to the original accession in the 'Related Accessions' field
  Scenario: Accession Spawn is not created due to missing required fields
    Given the user is on the New Accession page spawned from the original accession
     When the user clicks on 'Save'
     Then the following error message is displayed
      | Identifier - Property is required but was missing |