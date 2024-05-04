Feature: Pause a Monitoring
  As a user, I want to pause a Monitoring at any time.

  Scenario: Pausing a Monitoring
    Given a user pauses a "Monitoring"
    When receiving a valid "Monitoring"
    And update it in database
    Then return status code 200