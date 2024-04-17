public class ContactSearch {
    public static List<Contact>searchForContacts(String lastname, String PostalCode) {
        List<Contact> contacts = [
            SELECT ID,name FROM Contact WHERE Lastname =:lastname AND MailingPostalCode = :PostalCode];
        return contacts;
    }
}