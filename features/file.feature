Feature: File features

  @github @file
  Scenario: Upload file
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    And I switch to branch "master"
    When I upload the file "file_to_upload.txt"
    And I commit the file upload
      | file               | comment           | description       |
      | file_to_upload.txt | New file uploaded | New file uploaded |
    Then The file "file_to_upload.txt" is available in the repository
    And I logout from GitHub
    And the logout has success

  @github @file
  Scenario: Edit file
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    And I switch to branch "master"
    When I edit the file "file_to_upload.txt"
      | value            |
      | This text is new |
    And I commit the file edit
      | file               | comment   | description |
      | file_to_upload.txt | Edit file | Edit file   |
    Then The file "file_to_upload.txt" was successfully updated
    And I logout from GitHub
    And the logout has success

  @github @file
  Scenario: Delete file
    Given I login on GitHub with the following credentials
      | username | password   |
      | LM1978   | 1978lfnmrt |
    And the login has success
    And I open the repository "GitHub-Test"
    And I switch to branch "master"
    When I delete the file "file_to_upload.txt"
    And I commit the file delete
      | file               | comment     | description |
      | file_to_upload.txt | Delete file | delete file |
    Then The file "file_to_upload.txt" is not available in the repository
    And I logout from GitHub
    And the logout has success