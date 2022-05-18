Feature: deck of cards request

  Background: base url
    Given url 'https://deckofcardsapi.com'
   And def deck_id = ''

    Scenario: to hit the get request of shuffle the cards
     When path '/api/deck/new/shuffle/'
      And param deck_count = 1
      And method get
      And print response
      Then status 200
      And def deck_id = response.deck_id
      And print "deckId=" + deck_id

  Scenario: to hit the get request of draw the cards
    When path "https://deckofcardsapi.com/api/deck/" + deck_id + "/draw/"
    And param count = 2
    And method get
    And print response
    Then status 200

