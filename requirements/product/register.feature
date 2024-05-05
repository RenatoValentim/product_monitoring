Feature: Register a new Product
  As the system, I want to persist a Product

  Scenario: Found a Unavailable Product
    Given the system searches for a "Product"
    When receiving the "Product"
    And the "Product" is unavailable
    Then do nothing

  Scenario: Product not found
    Given the system searches for a "Product"
    When receiving the "Product"
    And finds nothing
    Then do nothing

  Scenario: Found a Product
    Given the system searches for a "Product"
    When receiving the "Product"
    And set "products.alert_sent = false"
    Then register it in database into the table "products"
