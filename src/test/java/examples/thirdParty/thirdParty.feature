Feature: Test scripts based on Third party account activities in Information bank.

  Background:
    * url baseUrl
    * def thirdParty = thirdPartyId
    * def subAccount = subAccountId
    * def acc_id = dataSubjectId
    * def procRequest = procRequestId
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

    Scenario: Creating a Processing request
      Given path 'thirdparty/accounts/', thirdParty,'/processingrequests'
      And headers tpAuthToken
      And request
      """
        {
          "data_subject_id": "#(acc_id)",
          "distinguishable_id": "ds01",
          "consent_form_id": "cf01",
          "processing_request_entries": [
            {
              "status": "NOT_DECIDED",
              "category_id": "cat01",
              "purpose_id": "pr01",
              "benefit_id": "ben01",
              "version": "1"
            }
          ]
        }
      """
      When method POST
      Then status 201

    Scenario: getting the details of the Processing request registered
      Given path 'thirdparty/accounts/', thirdParty,'/processingrequests/', procRequest
      And headers tpAuthToken
      When method GET
      Then status 200
      And match response contains
      """
      {
        "distinguishable_id": "ds01",
        "consent_form_id": "cf01",
        "processing_request_entries": [
          {
            "request_id": "#notnull",
            "request_entry_id": "#notnull",
            "display_order": "#notnull",
            "category_id": "cat01",
            "purpose_id": "pr01",
            "benefit_id": "ben01",
            "version": "1"
          }
          ]
      }
      """
        

