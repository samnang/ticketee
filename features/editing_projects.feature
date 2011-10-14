Feature: Editing Projects
  In order to edit a project information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    And there is a project called "Textmate 2"
    And I am on the homepage
    When I follow "Textmate 2"
    And I follow "Edit Project"

  Scenario: Updating a project
    When I fill in "Name" with "Textmate 2 beta"
    And I press "Update Project"
    Then I should see "Project has been updated."
    And I should be on the project page for "Textmate 2 beta"

  Scenario: Updating a project with invalid attributes is bad
    When I fill in "Name" with ""
    And I press "Update Project"
    Then I should see "Project has not been updated."
