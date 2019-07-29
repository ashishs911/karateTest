Feature: Test scripts based on Third party account activities in Information bank.

  Background:
    * url baseUrl
    * def thirdParty = thirdPartyId
    * def subAccount = subAccountId
    * def thirdPartyLogin = call read('classpath:examples/loginUtility/loginUtility.feature@name=ThirdParty')
    * def tpAuthToken = { Authorization : #(thirdPartyLogin.responseHeaders['Authorization'])}

    Scenario: Creating a sub account for a third party.
      Given path 'thirdparty/accounts/', thirdParty,'/sub'
      And headers tpAuthToken
      And request
      """
        {
          "first_name": "sub",
          "middle_name": "tp",
          "last_name": "acc",
          "email": "sub@xyz.com",
          "password": "subacc",
          "phone_number": "12331"
        }
      """
      When method POST
      Then status 201

    Scenario: accessing the details of the Sub account.
      Given path 'thirdparty/accounts/', thirdParty,'/sub/', subAccount
      And headers tpAuthToken
      When method GET
      Then status 200
        

