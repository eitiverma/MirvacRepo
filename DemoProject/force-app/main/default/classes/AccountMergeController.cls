public class AccountMergeController{

   public string var1{get;set;}
   public string var2{get;set;}
   public string var3{get;set;}
   public string var4{get;set;}
   public string var5{get;set;}
   public string var6{get;set;}
   public string var7{get;set;}
   public string var8{get;set;}
   public string var9{get;set;}
   public string var10{get;set;}
   public string var11{get;set;}
   public string var12{get;set;}
   public string var13{get;set;}
   public string var14{get;set;}
   public string var15{get;set;}
    public list<account> lst1 = new list<account>();
    public list<account> acclst{get;set;}
    public list<account> acclst1{get;set;} 
    public list<accMergeWrapper> wrapperList{get;set;}
     public list<accMergeWrapper> wrapperList1{get;set;}
     public string acc{get;set;}
     public boolean selected{get;set;}
    
    public AccountMergeController()
    {
        wrapperList = new list<accMergeWrapper>();
        wrapperList1 = new list<accMergeWrapper>();
        acclst1 = new list<account>();
        acclst = new list<account>();
        selected = false;
    }
    
   
    public pageReference searchAcc(){
       
        String strSql = 'SELECT AccountNumber,AccountSource,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingPostalCode,BillingState,BillingStreet,CreatedDate,Description,Fax,Id,Industry,LastModifiedById,LastModifiedDate,Name,NumberOfEmployees,NumberofLocations__c,AnnualRevenue,OwnerId,Ownership,Phone,Rating,ShippingCity,ShippingCountry,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet,Site,Type,Website FROM Account where name like \'%' + acc + '%\'' ;
        lst1= (List<account>) Database.query(strSql);
        for(Account a : lst1){
            wrapperList.add(new accMergeWrapper(a));
        }
        system.debug('######'+lst1);
        
        return null;  
    }
    
   
           
    
    
    public pageReference getSelected()
    {
       for(accMergeWrapper acc : wrapperList) {
       if(acc.selected==true){
           acclst1.add(acc.a);
            system.debug('&&&&&&&'+acclst1);
       }
      
       }
       
       return null;
    }
    
    
    
    
    public pageReference Next1(){
        pageReference prf = new pageReference('/apex/selectedAccount');
        prf.setRedirect(false);
        return prf;
    }
    
    public void Nextpage(){
         for(account a:acclst1){
          string s1 = ApexPages.currentPage().getParameters().get('id2');
        system.debug('lisssstttt'+s1);
         if(selected == true){
         system.debug('HELLLOOOO');
         string s = ApexPages.currentPage().getParameters().get('id1');
        system.debug('lisssstttt'+s);}
        }
       
     
    } 
    
    public list<selectOption> getgID(){
        list<selectOption> options = new list<SelectOption>();
        for(account a : acclst1){
            options.add(new SelectOption('ID',a.Id));
        }
        return options;
    }
    
    public class accMergeWrapper{
    public boolean selected{get;set;}
   
    public Account a{get;set;}
    accMergeWrapper(Account ac){
        a=ac;
        selected = false;
        
        
        }
        
        }
}