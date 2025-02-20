Feature: Top Container bulk operations
  Background:
    Given an administrator user is logged in
      And a Resource with 2 Top Containers has been created
      And the user is on the Top Containers page
      And the user fills in 'Keyword' with the Resource title
      And the user clicks on 'Search'
  Scenario: Select all Top Containers
     When the user checks the checkbox in the header row
     Then all Top Containers are selected
      And the 'Bulk Operations' button is active
  Scenario: Unselect all Top Containers
    Given all Top Containers are selected
     When the user checks the checkbox in the header row
     Then all Top Containers are unselected
      And the 'Bulk Operations' button is not active
  Scenario: Select Top Container
     When the user checks the checkbox in the left-hand column of Top container
     Then the Top Container is selected
      And the 'Bulk Operations' button is active
  Scenario: Update ILS holdings IDs of a Top Container
    Given a Top Container is selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Update ILS holdings IDs' in the dropdown menu
      And the user fills in 'ILS Holding ID' with '123456789'
      And the user clicks on 'Update 1 records' button
     Then the 'Top Containers' updated message is displayed
      And the 'ILS Holding ID' has value '123456789'
  Scenario: Update Container Profile of a Top Container by browsing
    Given a Top Container is selected
      And a Container Profile has been created
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Update Container Profile' in the dropdown menu
      And the user clicks on 'Browse' in the dropdown menu
      And the user selects Container Profile in the modal
      And the user clicks on 'Link' in the modal
      And the user clicks on 'Update 1 records' button
     Then the 'Top Containers' updated message is displayed
      And the Top Container profile is linked to the selected Container Profile
  Scenario: Update Container Profile of a Top Container by creating Container Profile
    Given a Top Container is selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Update Container Profile' in the dropdown menu
      And the user clicks on 'Create' in the dropdown menu
      And the user fills in 'Name' with 'Test Container Profile' in the modal
      And the user fills in 'Depth' with '90' in the modal
      And the user fills in 'Height' with '90' in the modal
      And the user fills in 'Width' with '90' in the modal
      And the user clicks on 'Create and Link' in the modal
      And the user clicks on 'Update 1 records' button
     Then the 'Top Containers' updated message is displayed
      And the 'Top Container Profile' has Name 'Test Container Profile'
  Scenario: Update Single Location of a Top Container by browsing
    Given a Top Container is selected
      And a Location has been created
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Update Locations: Single Location' in the dropdown menu
      And the user clicks on 'Browse' in the dropdown menu
      And the user selects Location in the modal
      And the user clicks on 'Link' in the modal
      And the user clicks on 'Update 1 records' button
     Then the 'Top Containers' updated message is displayed
      And the Top Container profile is linked to the selected Location
  Scenario: Update Single Location of a Top Container by creating Location
    Given a Top Container is selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Update Locations: Single Location' in the dropdown menu
      And the user clicks on 'Create' in the dropdown menu
      And the user fills in 'Building' with 'test building' in the modal
      And the user fills in 'Barcode' with '1234543' in the modal
      And the user clicks on 'Create and Link' in the modal
      And the user clicks on 'Update 1 records' button
     Then the 'Top Containers' updated message is displayed
      And the Top Container profile is linked to the created Location
  Scenario: Remove Locations from Top Containers without replacing the Locations
    Given two Top Containers A&B are created with Locations are created
      And the two Top Containers are selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Update Locations: Multiple Locations' in the dropdown menu
      And the user clicks on 'Update 2 records' button
     Then the 'Top Containers' updated message is displayed
      And the Locations are removed from the Top Containers
    Scenario: Add Barcodes associated with Top Containers successfully
      Given two Top Containers A&B are created
        And the two Top Containers are selected
       When the user clicks on 'Bulk Operations'
        And the user clicks on 'Rapid Barcode Entry' in the dropdown menu
        And the user fills in 'New Barcode' with '123456' for A Top Container
        And the user fills in 'New Barcode' with '678901' for B Top Container
        And the user clicks on 'Update 2 records' button
       Then the 'Top Containers' updated message is displayed
        And the Top Containers have new Barcodes
  Scenario: Barcodes associated with Top Containers are not added
    Given two Top Containers A&B are created
      And the two Top Containers are selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Rapid Barcode Entry' in the dropdown menu
      And the user fills in 'New Barcode' with '123456' for A Top Container
      And the user fills in 'New Barcode' with '123456' for B Top Container
      And the user clicks on 'Update 2 records' button
     Then the following error message is displayed
       |Barcode - A barcode must be unique within a repository|
  Scenario: Merge two Top Containers
    Given two Top Containers A&B are created
      And the two Top Containers are selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Merge Top Containers' in the dropdown menu
      And the user selects the Top Container B in the modal
      And the user clicks on 'Select merge target' in the modal
      And the user clicks on 'Merge 2 records' in the modal
     Then the 'Top Containers' merged message is displayed
      And the Top Container A is deleted
  Scenario: Delete two Top Containers
    Given two Top Containers A&B are created
      And the two Top Containers are selected
     When the user clicks on 'Bulk Operations'
      And the user clicks on 'Delete Top Containers' in the dropdown menu
      And the user clicks on 'Delete 2 records' in the modal
     Then the 'Top Containers' deleted message is displayed
      And the Top Containers A&B are deleted