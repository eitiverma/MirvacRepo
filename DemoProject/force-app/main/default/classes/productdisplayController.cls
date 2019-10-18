public class productdisplayController{

   

    public string keyval{get;set;}
    public string prodName{get;set;}
    public string Opt{get;set;}
     public string Oprtr{get;set;}
    public list<selectOption> lstOption;
     public list<selectOption> lstOperator;
     public list<Product2> lstprod{get;set;}
     public list<wrapProd> wraplst{get;set;}
     public list<wrapProd> sellst{get;set;}
     public list<opportunityLineItem> lst{get;set;}
      public list<opportunityLineItem> lstsel;
     public integer quant{get;set;}
     public integer price{get;set;}
     public opportunityLineItem obj{get;set;}
    public list<pricebookEntry> PriceId;
    public Id oppid;
    
    
    
    public productdisplayController()
    {
       
      oppid= ApexPages.currentPage().getParameters().get('id');
         
    }
    
     public productdisplayController(ApexPages.StandardController controller) 
     {
        
        oppid= ApexPages.currentPage().getParameters().get('id');

       wraplst = new list<wrapProd>();
        lstprod = new list<Product2>();
      PriceId = new  list<pricebookEntry>();
       sellst= new list<wrapProd>();
       lst = new list<opportunityLineItem>();
       lstsel = new list<opportunityLineItem>();
       
       
    }
    
    public list<selectOption> getListval()
    {
        lstOption = new list<SelectOption>(); 
        lstoption.add(new selectOption('name','Product name'));
        lstoption.add(new selectOption('ProductCode','Product code'));
        lstoption.add(new selectOption('family','Product family'));
        return lstoption;
    }
    
     public list<selectOption> getOperatorVal()
    {
        lstOperator = new list<SelectOption>(); 
        lstOperator.add(new selectOption('=','equals'));
        lstOperator.add(new selectOption('!=','not equals'));
       lstOperator.add(new selectOption('<>','contains'));
        return lstOperator;
    }
    
    public pageReference SearchProd()
    {
        
        string qrystring ='Select Id,ProductCode,Name,Family,IsActive,Description from Product2';
        
        if(keyval!=null && keyval!='')
        {
             qrystring += ' where Name'+ ' like \'%' + Keyval + '%\'';
             system.debug('VALUE'+qrystring);
        }
        else if(opt!=null && oprtr!=null && prodName!= null && (keyval==null || keyval== ''))
        {
            system.debug('enter in else if');
            qrystring += ' where ' + opt+' ' + oprtr+' ' + ':prodName';
        }
        else
        {
          qrystring = qrystring;
        }
        system.debug('QUERY STRING'+qrystring);
        lstProd = Database.query(qrystring);
        for(Product2 p :lstprod)
        {
           wraplst.add(new wrapProd(p)); 
        }
        
        
        return null;
    }
    
    public pageReference add()
    {
         for(wrapProd w: wraplst)
         {
             if(w.selected==true)
             {
               sellst.add(w);  
             }
         } 
         return null;      
    }
    
    public pagereference NextPg()
    {   
        for(wrapProd w: sellst)
        {
          obj = new OpportunityLineItem();
          obj.prodname__c= w.prod.id;
          lst.add(obj);  
          system.debug('SELECTED PROD'+lst);
        }
        
        pageReference pgref = new pageReference('/apex/productlineitemPage');
        pgref.setRedirect(false);
        return pgref;
    }
    
    public pageReference Save()
    {
       
         system.debug('OPPORTUNITY ID'+oppId);
        if(lst!=null)
        {
            for(opportunityLineitem ol: lst)
            {
             opportunityLineItem objlineitem = new OpportunityLineItem();
            system.debug('PRODUCT ID'+ol.prodname__c);
            priceID = [Select id from pricebookEntry where product2Id = :ol.prodname__c];
            system.debug('PRICE'+priceId);
            objlineitem.prodname__c= ol.prodname__c;
            
            objlineitem.quantity = ol.quantity ;
            objlineitem.UnitPrice= ol.UnitPrice;
            objlineitem.opportunityId = oppId;
            objlineitem.pricebookEntryId = priceId[0].Id;
            lstsel.add(objlineitem);  
            }
            system.debug('LST SELECTED'+lstsel);
            insert lstsel;
        } 
         pageReference pgref = new pageReference('/'+oppid);
        pgref.setRedirect(false);
        return pgref;
        
    }
    
    public class wrapProd
    {
        public boolean selected{get;set;}
        public Product2 prod{get;set;}
       /* public string code{get;set;}
        public string prodname{get;set;}
        public boolean active{get;set;}
        public Id pid{get;set;}*/
        
       public wrapProd(Product2 prd)
        {
        /* code = prd.ProductCode;
         active=prd.Isactive;
         prodname = prd.name;
         pid = prd.Id;*/
         prod = prd;
         selected = false;   
        }
    }
}