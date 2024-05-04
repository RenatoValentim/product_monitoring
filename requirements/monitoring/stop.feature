Feature: Stop a Monitoring
  As a user, I want to stop a Monitoring at any time.

  Scenario: Stopping a Monitoring with monitoring already done
    Given a user stops a "Monitoring"
    When checking the status of the "Monitoring" in the database
    And the "monitoring.status" already has "monitoring done"
    Then return status code 200

  Scenario: Stopping a Monitoring
    Given a user stops a "Monitoring"
    When receiving a valid "Monitoring"
    And the "monitoring.status" is not in the status "monitoring done"
    Then update it in database
    And return status code 200
