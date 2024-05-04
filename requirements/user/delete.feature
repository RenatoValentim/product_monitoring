Feature: Delete a User Account
  As a user, I want to delete my account and stop receiving alerts.

  Scenario: Deleting a User Account
    Given a user sends a "User" to the endpoint "http://url_api/api/user/delete"
    When receiving a valid "User"
    Then update the "deleted_at" field in the "users" table
    And return status code 200
