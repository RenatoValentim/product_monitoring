Feature: Delete a User Account
  As a user, I want to delete my account and stop receiving alerts.

  Scenario: Deleting a User Account
    Given a user sends a requst to the endpoint "http://url_api/api/user/delete"
    When receiving a "User"
    Then update the "users.deleted_at" column with the deleted data
    And remove the "auth_token"
    And return status code 200
