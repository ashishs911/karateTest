Feature: Test scripts based on DataSubject account Activities in Information bank.

  Background:
    * url baseUrl
    * def acc_id = dataSubjectId
    * def dataSubjectLogin = call read('classpath:examples/loginUtility/loginUtility.feature@name=DataSubject')
    * def authToken = { Authorization : #(dataSubjectLogin.responseHeaders['Authorization'])}

    Scenario: Creating a  new data subject account and delete it.
      Given path 'datasubject/accounts'
      And request {"account_id": #(~~(acc_id +1)), "first_name": "mfn", "middle_name": "doe", "last_name": "jr", "email": "aed@xyz.com", "phone_number": "12331", "password": "abcdef"}
      When method POST
      Then status 201

    Scenario: Delete the new datasubject account
      Given path 'datasubject/accounts', (~~(acc_id +1))
      And headers authToken
      When method DELETE
      Then status 200

    Scenario: getting details of the dataSubject account
      Given path 'datasubject/accounts', acc_id
      And headers authToken
      When method GET
      Then status 200
      And  match response contains {"first_name": "mfn", "middle_name": "doe", "last_name": "jr", "email": "aed@xyz.com", "phone_number": "12331"}

    Scenario: getting the processing requests for that data subject account
      Given path 'datasubject/accounts', acc_id,'/processingrequests'
      And headers authToken
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











