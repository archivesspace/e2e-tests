Feature: Digital Object Spawn from an Accession
  Background:
    Given an administrator user is logged in
      And the "Spawn description for Digital Object instances from linked record" setting is enabled in the Preferences
      And an Accession has been created
      And the Accession is opened in edit mode
  Scenario: Accession is linked to the spawned Digital Object
     When the user scrolls to the "Instances" section
      And the user clicks on "Add Digital Object"
      And the user selects "Create"
     Then the Create Digital Object modal is displayed
      And the following Digital Object forms have the same values as the Accession:
       | Title                               |
       | Date expression                     |
       | Date Begin                          |
       | Date End                            |
       | Languages                           |
       | Digital Object Note Type            |
       | Summary                             |
       | Bibliography                        |
       | Biographical/Historical             |
       | Conditions Governing Access         |
       | Conditions Governing Use            |
       | Custodial History                   |
       | Dimensions                          |
       | Existence and Location of Copies    |
       | Existence and Location of Originals |
       | General Note                        |
       | Physical Description                |
       | Immediate Source of Acquisition     |
       | Language of Materials               |
       | Legal Status                        |
       | Preferred Citation                  |
       | Processing Information              |
       | Related Materials                   |
       | Summary                             |
