function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	baseUrl : 'http://localhost:8080/v1/',
	thirdPartyId : '77455f66-ef6b-4d46-a3b6-17d6f3cce02f',
    subAccountId : '428bc15e-c249-4f23-8ea8-04593a2e2796',
    dataSubjectId : 60,

  };
  if (env == 'dev') {
  config.baseUrl = 'http://localhost:8080/v1/';
  config.dataSubjectId = 60;
  config.thirdPartyId = '77455f66-ef6b-4d46-a3b6-17d6f3cce02f';
  config.subAccountId = '428bc15e-c249-4f23-8ea8-04593a2e2796';


  } else if (env == 'e2e') {
  config.baseUrl = 'http://13.78.33.186:8080/v1';
  config.dataSubjectId = 59;
  config.thirdPartyId = 'f73dc100-5e75-4502-a602-534183cd5559';
  config.subAccountId = '22fe56c0-58e0-445a-81bb-c3a3dee205be';
  }
  return config;
}