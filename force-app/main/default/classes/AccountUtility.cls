public with sharing class AccountUtility {
    public AccountUtility() {

    }

    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        String acctRev;
        String template = '<{0}> : <{1}>,';

        for (Account item : accountsList) {
            String[] inputInfo = new List<String>{item.Name, String.valueOf(item.AnnualRevenue)};
            acctRev = acctRev + String.format(template, inputInfo);
            System.debug(acctRev);
        }

    }
}
