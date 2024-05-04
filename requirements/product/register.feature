Feature: Register a new Product
  As the system, I want to persist a Product

  Scenario: Found a Unavailable Product
    Given the system search for a "Product"
    When receiving the "Product"
    And the "Product" is unavailable
    Then do nothing

  Scenario: Found a Product
    Given the system search for a "Product"
    When receiving the "Product"
    Then register it in database into the table "products"
