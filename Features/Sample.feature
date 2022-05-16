Feature: Sample feature file
  
  Scenario: to check the data retrieved
    Given url 'http://localhost:9897/normal/webapi/all'
    When method get
    Then status 200

  Scenario: find job operation
      Given url 'http://localhost:9897/normal/webapi/find'
      When method get
      Then status 200