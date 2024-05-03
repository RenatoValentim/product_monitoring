Feature: Register a new Monitoring
  As a user, I want to persist a Monitoring

  Scenario: Receiving a Monitoring greater than 250 characters
    Given a user sends a "Monitoring" on endpoint "http://url_api/api/monitoring/register"
    When receiving the "Monitoring"
    And the length of the "Monitoring" query is greater than 250
    Then return status code 400 with the message "The product description must be less than or equal to 250 characters"

  Scenario: Receiving a Monitoring
    Given a user sends a "Monitoring"
    When receiving a valid "Monitoring"
    Then register it in database into the table 'monitoring' with the status 'to monitoring'
    And return status code 200
