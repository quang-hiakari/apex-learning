public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        List <Account> accounts = [SELECT Id, (SELECT Id from Contacts) FROM Account WHERE Id in :accountIds];

        for (Account acc: accounts) {
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }

        update accounts;
    }
    
    // public static void countContactsTemp(List<Id> listID) {
    //     List<Account> listAccounts = [SELECT Id, Name FROM Account WHERE Id IN :listID];

    //     for (Account accountItem : listAccounts) {
    //         List<AggregateResult> listContact = [SELECT COUNT(Id)total From Contact WHERE AccountId = :accountItem.Id];
    //         accountItem.Number_Of_Contacts__c = Integer.valueOf(listContact[0].get('total'));
    //     }

    //     update listAccounts;
    // }
}