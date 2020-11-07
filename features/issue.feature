Feature: Issue features

  @github @issue
  Scenario: Create issue
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    When I create the issue
      | title                   | description                   |
      | This is the issue title | This is the issue description |
    Then The issue with the title "This is the issue title" was successfully created
    And I logout from GitHub
    And the logout has success

  @github @issue
  Scenario: Close issue
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    When I close the issue
      | title                   |
      | This is the issue title |
    Then The issue "This is the issue title" is closed
    And I logout from GitHub
    And the logout has success

  @github @issue
  Scenario: Reopen issue
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    When I reopen the issue
      | title                   |
      | This is the issue title |
    Then The issue "This is the issue title" is reopened
    And I logout from GitHub
    And the logout has success
