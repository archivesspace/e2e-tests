Feature: Accession Container Instance
  Background:
    Given an administrator user is logged in
      And an Accession has been created
      And the Accession is opened in edit mode
  Scenario: Add container instance by creating Top Container
     When the user clicks on 'Instances'
      And the user clicks on 'Add Container Instance'
      And the user selects 'Accession' from 'Type' in the 'Instances' form
      And the user clicks on the first dropdown in the 'Instances' form
      And the user clicks on 'Create' in the dropdown menu from 'Top Container' in the 'Instances' form
      And the user fills in 'Indicator' with 'Top Container Indicator' in the modal
      And the user clicks on 'Create and Link' in the modal
      And the user clicks on 'Save Accession'
     Then the 'Accession' updated message is displayed
      And a new Instance is added to the Resource with the following values
       | Type             | Accession               |
       | Top Container    | Top Container Indicator |
  Scenario: Add container instance by browsing Top Container
     When the user clicks on 'Instances'
      And the user clicks on 'Add Container Instance'
      And the user selects 'Accession' from 'Type' in the 'Instances' form
      And the user clicks on the first dropdown in the 'Instances' form
      And the user clicks on 'Browse' in the dropdown menu from 'Top Container' in the 'Instances' form
      And the user fills in 'Keyword' with 'Container profile' in the modal
      And the user clicks on 'Search' in the modal
      And the user selects the Top Container from the search results in the modal
      And the user clicks on 'Link' in the modal
      And the user clicks on 'Save Accession'
     Then the 'Accession' updated message is displayed
      And a new Instance is added to the Resource with the following values
       | Type             | Accession               |
       | Top Container    | Top Container Indicator |