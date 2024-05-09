Feature: Pause Monitoring
  As a user, I want to pause monitoring at any time.

  Scenario: Pausing Monitoring
    Given a user pauses a "Monitoring"
    When receiving a valid "Monitoring"
    And update its status to 'paused' in the database
    Then return status code 200
