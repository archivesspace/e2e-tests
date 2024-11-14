Feature: Create an assessment for an Accession
  Background:
    Given an administrator user is logged in
    And an Accession has been created
    And the Accession is opened in edit mode
  Scenario: Assessment form is prefilled with Accession title
    When the user clicks on 'More' button on the toolbar
    And the user selects 'Create Assessment'
    Then the New Assessment page is displayed
    And the Assessment Records field is filled in with the Accession Identifier and Title