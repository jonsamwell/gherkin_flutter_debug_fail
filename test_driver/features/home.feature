Feature: Home screen

  As a user
  I want to tap increment button
  So that I can increment the count on counter

  @testable
  Scenario: increment button is available
    Given user is on the home page
    Then user should find the increment button