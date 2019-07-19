package examples.products;

import com.intuit.karate.junit5.Karate;

public class ProductsRunner {

    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("products").relativeTo(getClass());
    }

}
