package examples.products;

import com.intuit.karate.junit5.Karate;

public class DataSubjectRunner {

    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("products").relativeTo(getClass());
    }

}
