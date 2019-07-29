Feature: Test scripts based on Admin Activities in Information bank.

  Background:
    * url baseUrl
    * def thirdParty = thirdPartyId
    * def acc_id = dataSubjectId


  @name=Admin
  Scenario: log into Admin account
    Given path 'admin/accounts/admin/jwt/token'
    And request {"password": "admin"}
    When method POST
    Then status 200

  @name=ThirdParty
  Scenario: Login to Third Party Account
    Given path 'thirdparty/accounts/', thirdParty,'/jwt/token'
    And request {"password": "third"}
    When method POST
    Then status 200

  @name=DataSubject
  Scenario: logging into data subject account,
    Given path 'datasubject/accounts', acc_id,'/jwt/token'
    And request {"password": "abcdef"}
    When method POST
    Then status 200