Feature: Send a New Alert
  As the system, I want to send and persist an Alert.

  Scenario: Alert with an Empty Alert Target
    Given the system receives a request 'POST http://{API_URL}/api/products/sync {"event": "alert"}'
    When searching for an empty value in the "monitoring.alert_target" table field
    Then do nothing

  Scenario: Mobile Alert - Empty Phone Number
    Given the system receives a request 'POST http://{API_URL}/api/products/sync {"event": "alert"}'
    When searching for a "mobile" value in the "monitoring.alert_target" table field
    And searching for an empty value in the "users.phone_number" table field
    Then do nothing

  Scenario: Mobile Alert - Non-Empty Phone Number
    Given the system receives a request 'POST http://{API_URL}/api/products/sync {"event": "alert"}'
    When searching for a "mobile" value in the "monitoring.alert_target" table field
    And searching for a non-empty value in the "users.phone_number" table field
    Then send an alert to the available target option

  Scenario: Email Alert
    Given the system receives a request 'POST http://{API_URL}/api/products/sync {"event": "alert"}'
    When searching for an "email" value in the "monitoring.alert_target" table field
    Then send an alert
