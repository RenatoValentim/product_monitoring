Feature: Register a new Monitoring
  As a user, I want to persist a Monitoring

  Scenario: Receiving a Monitoring.Query greater than 250 characters
    Given a user sends a "Monitoring" on endpoint "http://url_api/api/monitoring/register"
    When receiving the "Monitoring"
    And the length of the "Monitoring.Query" is greater than 250
    Then return status code 400 with the message "The product description must be less than or equal to 250 characters."

  Scenario: Receiving a Monitoring.MobileAlert equal true
    Given a user sends a "Monitoring" on endpoint "http://url_api/api/monitoring/register"
    When receiving the "Monitoring"
    And the column of the table "users.phone_number WHERE phone_number = ''"
    And the "Monitoring.MobileAlert" is true
    Then return status code 400 with the message "For enable mobile alerts the user phone number is required."

  Scenario: Receiving a Monitoring.EmailAlert equal true
    Given a user sends a "Monitoring" on endpoint "http://url_api/api/monitoring/register"
    When receiving the "Monitoring"
    And the "Monitoring.EmailAlert" is true
    Then register it in database into the table "monitoring.status = 'to monitoring'"
    And "monitoring.alert = 'email'"
    And return status code 200

  Scenario: Receiving a minimum valid Monitoring
    Given a user sends a "Monitoring"
    When receiving a minimum valid "Monitoring"
    And the "Product" is unavailable
    Or the "Product" not found
    Then do nothing
    And return status code 200 with the message "Product not found, try again late."

  Scenario: Receiving a minimum valid Monitoring
    Given a user sends a "Monitoring"
    When receiving a minimum valid "Monitoring"
    Then register it in database into the table "monitoring" with the "monitoring.status = 'to monitoring'"
    And return status code 200
