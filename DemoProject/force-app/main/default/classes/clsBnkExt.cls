public class clsBnkExt {
private BankMaster__c a;
    public string bnkacc{
        get;
        set;
    }
    public pagereference bb()
    {
        a=[select name__c from BankMaster__c where name__c = :bnkacc];
        return null;
}
}