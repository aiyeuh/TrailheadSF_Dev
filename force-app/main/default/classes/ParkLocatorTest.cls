@isTest
public class ParkLocatorTest {
    @isTest
    static void ParkLocatorTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] arrayOfParks = ParkLocator.country('India');

        System.assertEquals('Park1', arrayOfParks[0]);
    }
}