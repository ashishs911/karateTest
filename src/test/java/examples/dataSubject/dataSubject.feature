Feature: an example test based on datasubject account

  Background:
    * url baseUrl
    * def acc_id = 58

    Scenario: Creating a data subject account
      Given path 'datasubject/accounts'
      And request {"account_id": #(acc_id), "first_name": "mfn", "middle_name": "doe", "last_name": "jr", "email": "aed@xyz.com", "phone_number": "12331", "password": "abcdef"}
      When method POST
      Then status 201

    Scenario: logging into data subject account, getting details of the account created and verifying the processing request for that data subject account
      Given path 'datasubject/accounts', acc_id,'/jwt/token'
      And request {"password": "abcdef"}
      When method POST
      Then status 200

      * def authBearer = responseHeaders['Authorization']
      * print 'authorization key is ', authBearer
      * def authval = { Authorization : #(authBearer)}

      Given path 'datasubject/accounts', acc_id
      And headers authval
      When method GET
      Then status 200
      And  match response contains {"first_name": "mfn", "middle_name": "doe", "last_name": "jr", "email": "aed@xyz.com", "phone_number": "12331"}

      Given path 'datasubject/accounts', acc_id,'/processingrequests'
      And headers authval
      When method GET
      Then status 200


  #Negative Scenarios

    Scenario: Trying to access data subject account without login
      Given path 'datasubject/accounts', acc_id
      When method GET
      Then status 401

    Scenario: Trying to create data subject account for existing ID
      Given path 'datasubject/accounts'
      And request {"account_id": #(~~(acc_id - 1)), "first_name": "mfn", "middle_name": "doe", "last_name": "jr", "email": "aed@xyz.com", "phone_number": "12331", "password": "abcdef"}
      When method POST
      Then status 422
      And match response contains {"name":"Object already exist"}

  Scenario: log into Admin account
    Given path 'admin/accounts/admin/jwt/token'
    And request {"password": "admin"}
    When method POST
    Then status 200









