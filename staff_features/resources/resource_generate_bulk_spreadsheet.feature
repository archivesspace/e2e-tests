Feature: Resource generate Bulk Archival Object Spreadsheet
  Background:
    Given an administrator user is logged in
      And a Resource has been created
      And the Resource is opened in edit mode
  Scenario: Resource Bulk archival object updater page is displayed
     When the user clicks on 'More'
      And the user clicks on 'Generate Bulk Archival Object Spreadsheet'
     Then the bulk archival object updater page is displayed
  Scenario: Resource Bulk Archival Object Spreadsheet is downloaded
    Given the user is on the Bulk archival object updater page
     When the user selects 'Record' from 'Records'
      And the user clicks on 'Download Spreadsheet'
     Then the Bulk Update Resource spreadsheet is downloaded
