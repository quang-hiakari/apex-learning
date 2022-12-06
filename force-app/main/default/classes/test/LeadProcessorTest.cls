@isTest
private with sharing class LeadProcessorTest {
    @isTest
    private static void testBatchClass() {
        //Load Test data
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i ++) {
            leads.add(new Lead(LastName = 'Quang', Company = 'Salesforce'));
        }
        insert leads;
        
        //Performe test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        //Check result
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: At least 1 record not updated correctly');
    }
    
}
