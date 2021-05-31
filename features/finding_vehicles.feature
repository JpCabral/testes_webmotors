# encoding: utf-8
Feature: Finding cars on Webmotors page

  Background:
    Given I am at Webmotors homepage

  Scenario: Searching Honda cars by brand in the homepage
    And search brand "Honda"
    And select brand "Honda" on search result
    Then check if results were found

  Scenario: Searching Honda City by model in the homepage
    And search model "Honda"
    And select model "Honda City" on search result
    Then the page should list results for "Honda City"
    Then check if results were found

  Scenario: Searching a non existent vehicle in the homepage
    And search model "veiculo_invalido"
    Then should not find any car

  Scenario: Filtering a Honda city in the Navigation Bar
    And click on "Ver ofertas" button
    And filter by "honda" brand
    And filter by "CITY" model
    Then the page should list results for "Honda City"
    Then check if results were found