package examples.dataSubject;

import com.intuit.karate.junit5.Karate;

public class DataSubjectRunner {

    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("dataSubject").relativeTo(getClass());
    }

}
