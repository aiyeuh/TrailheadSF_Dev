public class AccountHandler {
  public static Account insertNewAccount(String AccountName) {
    Account acc = new Account();
    acc.name = AccountName;
    try {
      insert acc;
    } catch (DMLException e) {
      return null;
    }
    return acc;
  }
}
