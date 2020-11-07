Feature: Login

  @github @login
  Scenario: Successfull login
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    Then the login has success
    And I logout from GitHub
    And the logout has success

  @github @login
  Scenario: Unuccessfull login
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1979   | 1978lfnmrt |
    Then the login has no success
