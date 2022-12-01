public with sharing class ContactAndLeadSearch {
    public ContactAndLeadSearch() {

    }

    public static List<List<sObject>> searchContactsAndLeads(String searchInput) {
        List<List<sObject>> resultList = [FIND :searchInput IN ALL FIELDS 
            RETURNING Contact(FirstName, LastName WHERE LastName=:searchInput), 
            Lead(FirstName, LastName WHERE Lastname=:searchInput)];
        
        return resultList;
    }
}
