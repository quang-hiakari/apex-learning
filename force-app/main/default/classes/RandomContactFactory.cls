public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfRecords, String lastName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < numberOfRecords; i++) {
            contacts.add(new Contact(FirstName = 'Test ' + i, LastName = lastName));
        }

        insert contacts;

        return contacts;
    }
}
