Feature: Top container Search
  Background:
    Given an administrator user is logged in
  Scenario: Search Top Container associated with a Resource
    Given a Top Container has been created for a Resource
     When the user clicks on the gear icon
      And the user clicks on 'Manage Top Containers'
      And the user filters by text with the Resource title
     Then the Top Container associated with the Resource is in the search results
  Scenario: Search Top Container associated with an Accession
    Given a Top Container has been created for an Accession
     When the user clicks on the gear icon
      And the user clicks on 'Manage Top Containers'
      And the user filters by text with the Accession title
     Then the Top Container associated with the Accession is in the search results