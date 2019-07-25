function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	baseUrl : 'http://localhost:8080/v1/',

  };
  if (env == 'dev') {
  config.baseUrl = 'http://localhost:8080/v1/';
  } else if (env == 'e2e') {
  config.baseUrl = 'http://13.78.33.186:8080/v1';
  }
  return config;
}