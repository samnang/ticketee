Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "Textmate 2"
    And there is a project called "Internet Explorer"
    And "user@ticketee.com" can view the "Textmate 2" project


  Scenario: Listing all projects
    Given I am on the homepage
    And I should not see "Internet Explorer"
    When I follow "Textmate 2"
    Then I should be on the project page for "Textmate 2"
