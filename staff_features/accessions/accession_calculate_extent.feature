Feature: Calculate extent of an accession
  Background:
   Given an administrator user is logged in
     And an Accession has been created
     And the Accession is opened in edit mode
  Scenario: Extent sub record is added to the Accession
    When the user clicks on 'More' button on the toolbar
     And the user selects 'Calculate Extent'
     And the user fills in 'Portion'
     And the user fills in 'Number'
     And the user fills in 'Type'
     And the user clicks on 'Create Extent'
     And the user clicks on 'Save'
    Then a new Extent sub-record should be added to the accession record
     And the 'Accession' updated message is displayed