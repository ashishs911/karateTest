# karateTest
This is a demo test project created for checking the feasibility of KarateDSL for our releases.
##Set up
###Pre-Requisite:
 Java JDK 
 Maven
 and github account
 
 ### setup to be done manually
 a. if its an exsitent project - add the following dependencies in your pom.xml
 
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
        
 b. if its a new project than follow the instruction in the video on Karate documentation and then add dependencies if you are using junit 5.
 
