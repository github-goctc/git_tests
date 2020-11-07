Feature: Project features

  @github @project
  Scenario: Create project
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    When I create the project
      | name                     | description                     |
      | This is the project name | This is the project description |
    Then The project with the name "This is the project name" was successfully created
    And I logout from GitHub
    And the logout has success

  @github @project
  Scenario: Delete project
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    When I delete the project
      | name                   |
      | This is the project name |
    Then The project " This is the project name" is deleted
    And I logout from GitHub
    And the logout has success
