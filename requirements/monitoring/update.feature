Feature: Update Monitoring
  As a job timer script, I want to update the Products in Monitoring at any time.

  Scenario: Updating Monitoring with unavailable product
    Given an update "Monitoring" job timer script is started
    When receiving updated data
    And the product is unavailable into the data
    Then stop the monitoring and changing the status to "monitoring done"

  Scenario: Updating Monitoring with updated product data
    Given an update "Monitoring" job timer script is started
    When receiving updated data
    Then insert a new entry in the database for this product
