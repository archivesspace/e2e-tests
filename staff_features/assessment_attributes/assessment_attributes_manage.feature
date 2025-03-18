Feature: Assessment Attributes manage
  Background:
    Given an administrator user is logged in
  Scenario:Add additional ratings
     When the user clicks on the gear icon
      And the user clicks on 'Manage Assessment Attributes'
      And the user clicks on add icon in the 'Ratings' form
      And the user fills in 'Rating value' with 'Test Rating'
      And the user clicks on 'Save Assessment Attribute'
     Then the 'Assessment Attributes' updated message is displayed
      And a new Attribute is added to the Repository Ratings
  Scenario:Delete additional ratings
    Given an Attribute Rating has been added to the Repository Ratings
     When the user clicks on the gear icon
      And the user clicks on 'Manage Assessment Attributes'
      And the user clicks on remove icon in the 'Repository Ratings' form
      And the user clicks on 'Save Assessment Attribute'
     Then the 'Assessment Attributes' updated message is displayed
      And the additional Attribute is removed from the Repository Ratings
  Scenario: Search Records associated with a particular rating
    Given an Assessment with a particular rating has been created for a record
     When the user clicks on the gear icon
      And the user clicks on 'Manage Assessment Attributes'
      And the user clicks on the magnifying glass icon to the right of the particular rating
     Then the record associated with the particular assessment rating is in the search results