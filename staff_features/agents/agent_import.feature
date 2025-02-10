Feature: Agent Import with the LCNAF Import Plug-In
  Background:
    Given an administrator user is logged in
      And an Agent has been created
  Scenario: Agent Import with the LCNAF Import Plug-In
     When the user clicks on the gear icon
      And the user hovers on 'Plug-ins' in the dropdown menu
      And the user clicks on 'LCNAF Import' in the dropdown menu
      And the user checks 'LCNAF - https://id.loc.gov/authorities/names' in the LCNAF Import form
      And the user fills in 'Primary Name' with 'Agent Name'
      And the user clicks on 'Search'
      And the user selects the first Agent from the search results
      And the user clicks on 'Import'
      And the user clicks on 'Refresh page'
     Then the Import Job page is displayed
      And the job completes
      And the Agent is listed in the New & Modified Records form
