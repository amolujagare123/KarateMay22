Feature: to test the sample REST API

  Background: opens url
    Given url 'https://reqres.in'

  Scenario: get all users
    Given path '/api/users'
    And param page = '2'
    When method get
    Then status 200

  Scenario: get single users
    Given path '/api/users/2'
    #And param page = '2'
    When method get
    Then status 200