public with sharing class PropertyUtility {
    public PropertyUtility() {

    }
    public static void newListedProperties() {
        List<Property__c> newPropList = [SELECT Name, Broker__r.Email__c, Days_On_Market__c
                        FROM Property__c
                        WHERE Days_On_Market__c <= 30];
        String propEmail;
        String template = '<{0}> : <{1}>,';

        for (Property__c item: newPropList) {
            String[] inputInfo  = new List<String>{item.Name, item.Broker__r.Email__c};
            propEmail  = String.format(template, inputInfo);
            System.debug(propEmail );
        }

    }
}
