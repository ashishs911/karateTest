# karateTest
This is a demo test project created for checking the feasibility of KarateDSL for our releases.
##Set up
###Pre-Requisite:
 * Java JDK 
 * Maven
 
 ### Setup to be done manually
 a. if its an existing project - add the following dependencies in your pom.xml
 
     <dependencies>
             <dependency>
                 <groupId>com.intuit.karate</groupId>
                 <artifactId>karate-apache</artifactId>
                 <version>${karate.version}</version>
                 <scope>test</scope>
             </dependency>            
             <dependency>
                 <groupId>com.intuit.karate</groupId>
                 <artifactId>karate-junit5</artifactId>
                 <version>${karate.version}</version>
                 <scope>test</scope>
             </dependency>
             <dependency>
                 <groupId>org.junit.jupiter</groupId>
                 <artifactId>junit-jupiter-engine</artifactId>
                 <version>5.4.0</version>
                 <scope>test</scope>
             </dependency>      
      </dependencies>  
        
 b. if its a new project than follow the instruction in the video on Karate documentation and then add only junit jupiter dependencies if you are using junit 5.
    for Junit 4 only the other 2 dependencies should work.
    
 c. add the surefire plugin to the pom.xml file in the build section to generate the report while running your test using command line.
 
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>2.22.2</version>
    </plugin>
 
    
##Script Basics:
 * **Feature File** - A feature file is a repository of our tests which belong to a certain workflow of our API.
  A feature file can contain multiple scenarios covering the whole workflow or a single scenario which we want to re-use in other scenarios.
  A feautre file constitutes of background and scenarios
    * **Scenario** - A scenario is an Independent test script unit which doesn't depend on the variables set or used by other scenarios within the same feature file.
        A scenario is made of a single or multiple  *Given-When-Then* flows, depending upon the use cases.
      * **Given** - Given part of the test script contains the setup specific to that script which can be the API endpoint addition to the base URL and headers.
      * **When** - When part of the script define the actions we are going to perform in that test like different API method calls i.e. POST, GET etc. and the request body.
      * **Then** - Then part of the script define pur expectation from the API and the assertions we want to perform in that script.
    * **Background** - Background consists of  the global setup or the reusable variable across that feature file.
 
 * **Runner Class** - Runner class is the Java Class we are using to invoke Junit to run the test written in Karate scripts.
 
 * **Karate-config.js** this file is the place where we can do all environment specific settings specially when we want to test our script on the local dev environment before committing them to github.
 It also provides us with a common place to do the global setup which is shared amongst all the feature files e.g. baseurl details for the API.
 
##Running Scripts Using Jenkins:
 To run Karate scripts periodically with CI tool like Jenkins we just need to define the Maven test command in the build step section of the Jenkins job.
###Steps to setup Jenkins:
 * Login to your jenkins Instance, click on new Item and select a Freestyle project.
 * In the configuration of Freestyle project Provide the details of your Github project and repository.
 * In the build step select Invoke top level maven targets add the following command. 
 
        clean test -DargLine="-Dkarate.env=e2e" -Dtest=DataSubjectRunner
 
    * -Dtest - option defines the tests we want to run, If we are not running the whole project , optional.
    * -Dargline - parameter defines the Environment in which we want to run our scripts using Karate variable Karate.env, optional.
 * Save the Project and click on build now.
 
 
