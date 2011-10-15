Feature: Seed Data
  In order to fill database with the basics
  As the system
  I want to run seed data

  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    Then I should see "Ticketee Beta"
