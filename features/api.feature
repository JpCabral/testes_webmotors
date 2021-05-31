@screenless
Feature: Testing the Webmotors test Api's

  Scenario: Testing the Make Api
    When the make request is made
    Then expect the make request result to be the same
    Then check if the return code was 200
  
  Scenario: Testing the Model Api
    When the model request is made with MakeID 1
    Then expect the model request result to be the same
    Then check if the return code was 200
  
  Scenario: Testing the Version Api
    When the version request is made with ModelID 1
    Then expect the version request result to be the same
    Then check if the return code was 200

  Scenario: Testing the Vehicles Api
    When the vehicles request is made with Page 1
    Then expect the vehicles request result to be the same
    Then check if the return code was 200