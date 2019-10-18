public class insertacc {
 public string accname
 {
     get;
     set;
 }
    public pagereference saveacc()
    {
        Account a=new Account(name=accname);
        insert a;
        
PageReference acctPage = new ApexPages.StandardController(a).view();
acctPage.setRedirect(false);
return acctPage;
}
}