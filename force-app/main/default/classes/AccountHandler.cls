public class AccountHandler {
    public static Account insertNewAccount(String inputName) {
        try {
            Account newAccount = new Account();
            newAccount.Name = inputName;
            upsert newAccount;
            System.debug(newAccount);
            return newAccount;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
        }
    }
}
