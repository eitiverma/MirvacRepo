public class customLookupCntrl{

    public String accountnumber { get; set; }
    public String accountid { get; set; }
    public string laccountName{get;set;}
    public list<Account> acc{get;set;}  
    
     public customLookupCntrl()
    {
         acc = [Select id, Name, AccountNumber from Account];         
        }     

    public void PopulateAccNumber() 
    {
        // acc = [Select id, Name, AccountNumber from Account where id=:accountid];
        
    }

}