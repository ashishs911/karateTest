Feature: an example test based on best buy

  Background:
    * url 'http://localhost:8080/v1/'
    * header Accept = 'application/json'

    Scenario: getting the list of products
      Given path 'datasubject/accounts'
      And request {"account_id": "8", "first_name": "mfn", "middle_name": "doe", "last_name": "jr", "email": "aed@xyz.com", "phone_number": "12331", "password": "abcdef"}
      When method POST
      Then status 201


