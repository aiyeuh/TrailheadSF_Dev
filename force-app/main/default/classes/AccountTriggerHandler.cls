public with sharing class AccountTriggerHandler {
  public static void CreateAccounts(List<Account> listAcct) {
    for (Account acc : listAcct) {
      if (acc.ShippingState != acc.BillingState) {
        acc.ShippingState = acc.BillingState;
      }
    }
  }
}
