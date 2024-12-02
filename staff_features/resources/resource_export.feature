Feature: Resource Export
  Background:
    Given an administrator user is logged in
      And a Resource has been created
      And the Resource is opened in edit mode
  Scenario: Resource export records in EAD
     When the user clicks on 'Export'
      And the user clicks on 'Download EAD' in the dropdown menu
     Then the ead.xml file is downloaded
  Scenario: Resource export records in MARCXML
     When the user clicks on 'Export'
      And the user clicks on 'Download MARCXML' in the dropdown menu
     Then the marc21.xml file is downloaded
  Scenario: Resource export records in container labels
     When the user clicks on 'Export'
      And the user clicks on 'Download Container Labels' in the dropdown menu
     Then a new 'container label' job is opened in a new tab
  Scenario: Resource export records in container template
     When the user clicks on 'Export'
      And the user clicks on 'Download Container Template' in the dropdown menu
     Then the .csv file is downloaded
  Scenario: Resource export records in digital object template
     When the user clicks on 'Export'
      And the user clicks on 'Download Digital Object Template' in the dropdown menu
     Then the digital_object_template file is downloaded
  Scenario: Resource export records in pdf
     When the user clicks on 'Export'
      And the user clicks on 'Generate PDF' in the dropdown menu
     Then a new 'print to pdf' job is opened in a new tab
    