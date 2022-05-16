package TestRunner;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.*;

public class TestRunner {

  /* @Test
    public Karate runTest()
    {
        return Karate.run("Features/Sample2.feature");
    }*/

    @Test
    public Karate runTest()
    {
        return Karate.run("Features/Reqres.feature");
    }

   /* @Test
    public Karate runTest()
    {
        return Karate.run("Features");
    }*/

}
