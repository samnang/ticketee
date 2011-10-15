Feature: Assigning Permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
      | user@ticketee.com  | password | false |
    And there is a project called "TextMate 2"
    And I am signed in as "admin@ticketee.com"
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"

    And I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"
