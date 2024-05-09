Feature: Register a new user
  As a user, I want to create an account to be able to register products for monitoring.

  Scenario: Receiving a Username greater than 250 characters
    Given a user sends a "User" to the endpoint "http://{API_URL}/api/user/register"
    When receiving the "User"
    And the length of the "User.Username" is greater than 250
    Then return status code 400 with the message "The username must be less than or equal to 250 characters"

  Scenario: Receiving a User with an empty Username
    Given a user sends a "User" to the endpoint "http://{API_URL}/api/user/register"
    When receiving the "User"
    And the "User.Username" is empty
    Then return status code 400 with the message "The user username is required"

  Scenario: Receiving a User with an empty Email
    Given a user sends a "User" to the endpoint "http://{API_URL}/api/user/register"
    When receiving the "User"
    And the "User.Email" is empty
    Then return status code 400 with the message "The user email is required"

  Scenario: Receiving a valid User
    Given a user sends a "User" to the endpoint "http://{API_URL}/api/user/register"
    When receiving a valid "User"
    Then register it in the database in the "users" table
    And return status code 200
