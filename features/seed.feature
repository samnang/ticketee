Feature: Seed Data
  In order to fill database with the basics
  As the system
  I want to run seed data

  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    Then I should see "Ticketee Beta"
    When I follow "Ticketee Beta"
    And I follow "New Ticket"
    And I fill in "Title" with "Comment with state"
    And I fill in "Description" with "Comment always have a state"
    And I press "Create Ticket"
    Then I should see "New" within "#comment_state_id"
    Then I should see "Open" within "#comment_state_id"
    Then I should see "Closed" within "#comment_state_id"
