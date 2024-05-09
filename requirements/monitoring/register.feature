Feature: Register a New Monitoring
  As a user, I want to persist a Monitoring.

  Scenario: Receiving a Monitoring Query Greater than 250 characters
    Given a user sends a request "http://{API_URL}/api/monitoring/register '{..."query": "1,2...500"...}'"
    When receiving the "request.body"
    And the length of the "request.body.query" is greater than 250
    Then return status code 400 with the message "The product description must be less than or equal to 250 characters."

  Scenario: Receiving a Monitoring with MobileAlert Set to True
    Given a user sends a request "http://{API_URL}/api/monitoring/register '{..."mobile_alert": true...}'"
    When receiving the "request.body"
    And the user's phone number is not provided on "database.table.users.phone_number"
    Then return status code 400 with the message "To enable mobile alerts, the user's phone number is required."

  Scenario: Receiving a Monitoring with EmailAlert Set to True
    Given a user sends a request "http://{API_URL}/api/monitoring/register '{..."email_alert": true...}'"
    When receiving the "request.body"
    Then register it in the database with "database.table.monitoring.status = 'to monitoring'"
    And "database.table.monitoring.alert_target = 'email'"
    And return status code 200

  Scenario: Receiving a Minimum Valid Monitoring
    Given a user sends a "Monitoring"
    When receiving a minimum valid "Monitoring"
    Then register it in the database with "monitoring.status = 'to monitoring'"
    And return status code 200

