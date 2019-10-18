public class AccountController {
 @AuraEnabled
    public static Account getAccount(Id accId) {
        return [
            SELECT Id, Name, site, AnnualRevenue 
            FROM Account
            WHERE Id =:accId
        ][0];
    }

    @AuraEnabled
    public static Account saveAccount(Account acc) {
        update acc;
        return acc;
    }
}