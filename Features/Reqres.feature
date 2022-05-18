Feature: to test the sample REST API

  Background: opens url
    Given url 'https://reqres.in'

  Scenario: get all users
    Given path '/api/users'
    And param page = '2'
    When method get
    And print response
    Then status 200
    And match response ==
    """
{
  "page": 2,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 7,
      "email": "michael.lawson@reqres.in",
      "first_name": "Michael",
      "last_name": "Lawson",
      "avatar": "https://reqres.in/img/faces/7-image.jpg"
    },
    {
      "id": 8,
      "email": "lindsay.ferguson@reqres.in",
      "first_name": "Lindsay",
      "last_name": "Ferguson",
      "avatar": "https://reqres.in/img/faces/8-image.jpg"
    },
    {
      "id": 9,
      "email": "tobias.funke@reqres.in",
      "first_name": "Tobias",
      "last_name": "Funke",
      "avatar": "https://reqres.in/img/faces/9-image.jpg"
    },
    {
      "id": 10,
      "email": "byron.fields@reqres.in",
      "first_name": "Byron",
      "last_name": "Fields",
      "avatar": "https://reqres.in/img/faces/10-image.jpg"
    },
    {
      "id": 11,
      "email": "george.edwards@reqres.in",
      "first_name": "George",
      "last_name": "Edwards",
      "avatar": "https://reqres.in/img/faces/11-image.jpg"
    },
    {
      "id": 12,
      "email": "rachel.howell@reqres.in",
      "first_name": "Rachel",
      "last_name": "Howell",
      "avatar": "https://reqres.in/img/faces/12-image.jpg"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}

    """

  Scenario: get single users
    Given path '/api/users/2'
    #And param page = '2'
    When method get
    And print response
    Then status 200
    And match response ==
    """
    {
  "data": {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "first_name": "Janet",
    "last_name": "Weaver",
    "avatar": "https://reqres.in/img/faces/2-image.jpg"
  },
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}

    """


  Scenario: get single users - contains method assertion
    Given path '/api/users/2'
    #And param page = '2'
    When method get
    And print response
    Then status 200
    And match response contains  deep {  "data": {  "id": 2} }
    And match response contains  deep { "support": {  "url": "https://reqres.in/#support-heading"} }


  Scenario: get single users - jsonpath assertion
    Given path '/api/users/2'
    #And param page = '2'
    When method get
    And print response
    Then status 200
    And match response.support.url == 'https://reqres.in/#support-heading'

    Scenario: create a user request - jsonpath assertion
      Given path '/api/users/'

      And request
      """
        {
        "name": "morpheus",
        "job": "leader"
        }
      """
     # And headers { Accept = "application/json" }
      When method post
      And print response
      Then status 201
      And match response.job == 'leader'


  Scenario: update a user request - jsonpath assertion
    Given path '/api/users/2'
    And request
      """
        {
        "name": "amol",
        "job": "tester"
        }
      """
    When method put
    And print response
    Then status 200
    And match response.job == 'tester'

  Scenario: delete a user request - jsonpath assertion
    Given path  '/api/users/2'
    When method delete
    Then status 204
