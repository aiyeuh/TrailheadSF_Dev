@isTest
private class AccountTriggerTest {
  @isTest
  static void TestCreateAccount() {
    List<Account> listacc = new List<Account>();
    for (Integer i = 0; i < 10; i++) {
      Account acc = new Account(Name = 'Pai Test' + i, BillingState = 'CA');
      listacc.add(acc);
    }

    //Perform test
    Test.startTest();
    insert listacc;
    Test.stopTest();

    //Make Sure
    List<Account> newlist = [
      SELECT Id, Name, ShippingState
      FROM Account
      WHERE ShippingState = 'CA'
    ];
    for (Account acct : newlist) {
      System.assertEquals('CA', acct.ShippingState, 'ERROR');
    }
  }
}
