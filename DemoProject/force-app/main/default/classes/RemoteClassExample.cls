public class RemoteClassExample{
    
    public static Account objacc{get;set;}
    public string accName{get;set;}
    
    public RemoteClassExample()
    {
        objacc = new Account();
       
    }
    
    @RemoteAction
    public static Account getAccountName(string accName){
        
         objacc = [select name,id from account where name=:accName];
         return objacc;    
    }
}