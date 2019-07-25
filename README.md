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
    
 c. add the surefire plugin to the pom.xml file in the build section to generate the report while running your test using jenkins CI.
 
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>2.22.2</version>
    </plugin>
    
 #Script Basics:
 * **Feature File** - A feature file is a repository of our tests which belong to a certain workflow of our API.
  A feature file can contain multiple scenarios covering the whole workflow or a single scenario which we want to re-use in other scenarios.
  A feautre file constitutes of background and scenarios
    * **Scenario** - A scenario is an Independent test script unit which doesn't depend on the variables set or used by other scenarios within the same feature file.
        A scenario is made of a single or multiple  *Given-When-Then* flows, depending upon the use cases.
    * **Background** - Background consists of  the global setup or the reusable variable across that feature file.
 
 * **Runner Class** - 
 
 
