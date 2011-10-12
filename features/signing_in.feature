Feature: Signing in
  In order to user the sise
  As a user
  I want to be able to sign in

  Scenario: Sign in via confirmation
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    And I should see "Signed in as user@ticketee.com"
