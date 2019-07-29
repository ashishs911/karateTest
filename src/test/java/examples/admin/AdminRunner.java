package examples.admin;

import com.intuit.karate.junit5.Karate;

public class AdminRunner {

    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("admin").relativeTo(getClass());
    }
}
