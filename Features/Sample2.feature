Feature: Sample feature file

  Background: get Base URL
    Given url 'http://localhost:9897'

  Scenario: to check the data retrieved
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: find job operation
    Given path '/normal/webapi/find'
    When method get
    Then status 200