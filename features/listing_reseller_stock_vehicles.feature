# encoding: utf-8
Feature: Listing reseller stock vehicles

  Background:
    Given I am at Mazola Automóveis reseller stock page

  Scenario: Filtering a Ford Fusion in the reseller stock
    And filter by "ford" brand
    And filter by "FUSION" model
    Then check if results were found
    Then the page shows the "Ford Fusion" cars available on stock