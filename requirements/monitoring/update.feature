Feature: Update Monitoring
  As a job timer script, I want to update the Products in Monitoring at any time.

  Scenario: Updating Monitoring with unavailable product
    Given an update "Monitoring" job timer script is started
    When receiving updated data
    And the product is unavailable in the data
    Then stop the monitoring and change the status to "monitoring done"
    And if "monitoring.alert_target 'mobile'", send a mobile alert notifying that the alert will be stopped
    And update "monitoring.alert_target = ''"
    Or if "monitoring.alert_target = 'email'", send an email alert notifying that the alert will be stopped
    and update "monitoring.alert_target = ''"

  Scenario: Updating Monitoring with updated product data
    Given an update "Monitoring" job timer script is started
    When receiving updated data
    Then insert a new entry in the database for this product
    And execute "SELECT * FROM monitoring WHERE status = 'in monitoring' ORDER BY updated_at DESC LIMIT 1;"
    And if "monitoring.alert_target = 'mobile'", send an mobile alert notifying about the product update
    Or if "monitoring.alert_target = 'email'", send an email alert notifying about the product update
