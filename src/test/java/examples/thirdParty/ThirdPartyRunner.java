package examples.thirdParty;

import com.intuit.karate.junit5.Karate;

public class ThirdPartyRunner {

    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("thirdParty").relativeTo(getClass());
    }
}
