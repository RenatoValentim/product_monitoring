Feature: Update Monitoring
  As a job timer script, I want to update the Products in Monitoring at any time.

  Scenario: Updating Monitoring with Unavailable Product
    Given an update "Monitoring" job timer script is started
    When receiving updated data
    And the product is unavailable in the data
    Then stop the monitoring and change the status to "monitoring done"
    And if "monitoring.alert_target" is set to 'mobile', send a mobile alert notifying that the alert will be stopped
    And update "monitoring.alert_target" to ''
    Or if "monitoring.alert_target" is set to 'email', send an email alert notifying that the alert will be stopped
    and update "monitoring.alert_target" to ''

  Scenario: Updating Monitoring with Updated Product Data
    Given an update "Monitoring" job timer script is started
    When receiving updated data
    Then insert a new entry in the database for this product
