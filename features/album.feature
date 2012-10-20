Feature: Albums
  create, edit and delete albums

  Background:
    Given the following user records
      | email             | password  |
      | user@example.com  | 123123    |

  Scenario: Creating a new album
    When I visit the login site
    And I fill in the login form with "user@example.com" and "123123"
    And I visit the create a new album site
    And I fill in the new album form with "Best Of" and "Elton John"
    Then I should see "Elton John"
    And I should have the album "Elton John" in the database

