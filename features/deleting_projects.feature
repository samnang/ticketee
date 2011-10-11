Feature: Deleting Projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear

  Scenario: Deleting a project
    Given there is a project called "Textmate 2"
    And I am on the homepage
    When I follow "Textmate 2"
    And I follow "Delete Project"
    Then I should see "Project has been deleted."
    And I should not see "Textmate 2"
