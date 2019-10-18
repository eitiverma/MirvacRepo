public with sharing class pdfclass {

    public List<Account> Acc { get; set; }
    public pdfclass(){
    acc=new List<Account> ();
     Acc=[Select id,name,phone,fax from Account where phone != null limit 50];
    }
}