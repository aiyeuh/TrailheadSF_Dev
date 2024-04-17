public with sharing class AccountUtils {
  public static List<Account> accountsByState(String bilingabbr) {
    List<Account> listaccount = [
      SELECT Id, Name
      FROM Account
      WHERE BillingState = :bilingabbr
    ];
    return listaccount;
  }
}
