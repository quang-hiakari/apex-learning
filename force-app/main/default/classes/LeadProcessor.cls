public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordCount = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    public void execute(Database.BatchableContext bc, List<Lead> leads){
        // process each batch of records
        for (Lead l: leads) {
            l.LeadSource = 'DreamForce';
        }
        update leads;

        recordCount = recordCount + leads.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Total records processed ' + recordCount);
        System.debug('Done');
    }
}