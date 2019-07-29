package examples.loginUtility;

import com.intuit.karate.junit5.Karate;

public class LoginUtilityRunner {

    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("loginUtility").relativeTo(getClass());
    }
}
