Feature: Stop Monitoring
  As a user, I want to stop monitoring at any time.

  Scenario: Stopping Monitoring with Monitoring Already Done
    Given a user stops a "Monitoring"
    When checking the status of the "Monitoring" in the database
    And the "monitoring.status" is set to 'monitoring done'
    Then return status code 200

  Scenario: Stopping Monitoring
    Given a user stops a "Monitoring"
    When receiving a valid "Monitoring"
    And the "monitoring.status" is not 'monitoring done'
    Then update it in the database
    And return status code 200
