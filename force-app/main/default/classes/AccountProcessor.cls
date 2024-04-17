public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> setId) {
        List<Account>lstContacts= [SELECT Id,Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :setId ];
        for (Account acc : lstContacts){
            List<Contact> LstCon = acc.Contacts;

            acc.Number_Of_Contacts__c = LstCon.size();
        }
        update lstContacts;
    }
}