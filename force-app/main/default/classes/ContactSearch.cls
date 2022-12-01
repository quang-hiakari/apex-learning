public with sharing class ContactSearch {
    public ContactSearch() {

    }

    public static Contact[] searchForContacts(String lastName, String postalCode) {
        // List<Account>() filterdAccount = [SELECT ID, Name ]
        Contact[] filterdAccount = [SELECT ID, Name FROM Contact WHERE (MailingPostalCode =:postalCode AND LastName =:lastName) ];

        System.debug(filterdAccount);
        return filterdAccount;
    }
}
