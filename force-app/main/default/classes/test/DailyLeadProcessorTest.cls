@isTest
private with sharing class DailyLeadProcessorTest {

    private static String CRON_EXP = '0 0 0 ? * * *';

    @IsTest
    private static void testSchedulableClass() {
        //Load Tesst data
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 500; i++) {
            if (i < 250) {
                leads.add(new Lead(LastName = 'Quang', Company = 'Saleforce'));
            } else {
                leads.add(new Lead(LastName = 'Quang', Company = 'Saleforce', LeadSource = 'Other'));
            }
        }

        insert leads;

        //Perform the test
        Test.startTest();
        String jobId = System.schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        //Check the result
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: At least 1 record not updated correctly');

        //Check the schedule time
        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.debug('Next time is ' + cts[0].NextFireTime);

    }
}
