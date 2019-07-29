Feature: Test scripts based on Admin Activities in Information bank.

  Background:
    * url baseUrl
    * def adminLogin = call read('classpath:examples/loginUtility/loginUtility.feature@name=Admin')
    * def authToken = { Authorization : #(adminLogin.responseHeaders['Authorization'])}
    * def thirdParty = thirdPartyId

      
    Scenario: Admin Creates a Third Party Account.
      Given path 'admin/thirdparties'
      And headers authToken
      And request {"name": "TP_first", "email": "tp@xyz.com", "phone_number": "12331", "password": "third"}
      When method POST
      Then status 201

    Scenario: Check the details of the third Party Created

      Given path 'admin/thirdparties', thirdParty
      And headers authToken
      When method GET
      Then status 200
      And match response contains {"name": "TP_first", "email": "tp@xyz.com", "phone_number": "12331"}