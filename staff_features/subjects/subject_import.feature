Feature: Subject Import with the LCNAF Import Plug-In
  Background:
    Given an administrator user is logged in
      And a Subject has been created
      And the user is on the ArchivesSpace homepage
  Scenario: Subject Import with the LCNAF Import Plug-In
     When the user clicks on 'Repository settings'
      And the user clicks on 'LCNAF Import' in the dropdown menu in the 'Plug-ins'
      And the user clicks on 'LCSH - https://id.loc.gov/authorities/subjects' in the 'LCNAF Import' form
      And the user fills in 'Primary Name' with 'subject heading'
      And the user clicks on 'Search'
      And the user selects the Subject from the search results in the modal
      And the user clicks on 'Import'
     Then the Import Job page is displayed
      And the job completes
      And the following message is displayed
       |The job has completed.|
  Scenario: Complete import process using th LCNAF Import Plug-In
    Given the Import Job page is displayed
     When the user clicks on 'Refresh Page'
     Then the Subject is listed in the New & Modified Records form
