Feature: Authenticate
  In order to provide authentication
  The Application should provide a login

  Background:
    Given the following user records
      | email             | password  |
      | user@example.com  | 123123    |

  Scenario: Successful Login
    When I visit the login site
    And I fill in the login form with "user@example.com" and "123123"
    Then I should see "Signed in successfully"

  Scenario: Login with wrong password
    When I visit the login site
    And I fill in the login form with "user@example.com" and "123"
    Then I should see "Invalid email or password"
