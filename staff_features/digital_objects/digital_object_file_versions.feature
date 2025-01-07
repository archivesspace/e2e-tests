Feature: Digital Object File versions
  Background:
    Given an administrator user is logged in
      And a Digital Object has been created
      And the Digital Object is opened in the edit mode
  Scenario: Add a single File Version with required fields
     When the user clicks on 'Add File Version' in the 'File Versions' form
      And the user fills in 'File URI' with 'http://example.com/file.pdf'
      And the user clicks on 'Save Digital Object'
     Then the File Version with File URI 'http://example.com/file.pdf' is linked to the Digital Object
      And the 'Digital Object' updated message is displayed
  Scenario: Add multiple File Versions and display only the last published one
    Given the user has added a File Version 1 with File URI 'http://example.com/file1.pdf' and the 'Publish' box checked
      And the user has added File Version 2 with File URI 'http://example.com/file2.pdf' and the 'Publish' box checked
     When the Digital Object is opened in the public interface
     Then only File Version 2 with File URI 'http://example.com/file2.pdf' is displayed
  Scenario: Make a File Version representative in ArchivesSpace public interface
    Given the user has added multiple File Versions to the Digital Object
     When the user clicks on 'Make Representative' for 'File Version 1'
      And the user clicks on 'Save Digital Object'
     Then File Version 1 is marked as the representative and displays in the public interface
  Scenario: Remove a File Version from a Digital Object
    Given the user has added a File Version with File URI 'http://example.com/file1.pdf' in the Digital Object
     When the user clicks on 'X' in the 'File Version' form
      And the user clicks on 'Confirm Removal'
      And the user clicks on 'Save Digital Object'
     Then the File Version with File URI 'http://example.com/file1.pdf' is removed from the Digital Object
      And the 'Digital Object' updated message is displayed
