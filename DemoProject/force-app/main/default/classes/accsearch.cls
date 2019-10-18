public class accsearch {
    list<Account> l1 ;
    public accsearch()
    {
        l1= new list<Account>();
    }
    public string accname
    {
        get;
        set;
    }
    public list<Account> getresult()
    {
        return l1;
    }
    public pageReference searchAccount()
    {
        l1=[select phone,name,fax from Account where name=:accname];
        return null;
    }

}