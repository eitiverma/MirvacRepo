public class WizardController{
        
         account a;
         contact c;
         opportunity o;
         OpportunityContactRole r;
         

            public Account getAccount(){
            if(a== null)
            a = new Account();
            return a;           
            }      
            
            public Contact getContact(){
            if (c== null)
            c = new Contact();
            return c;           
            } 
            public Opportunity getOpportunity(){
            if (o== null)
            o = new Opportunity();
            return o;           
            }  
             
            public OpportunityContactRole  getRole (){
            if (r== null)
            r = new OpportunityContactRole ();
            return r;           
            } 
             
             public PageReference step1(){
                return page.wizard1;
                }
                 
                 
               public PageReference step2(){
                 return page.wizard2;
                 }
                 
                  public PageReference step3(){
                 return page.wizard3;
                 }
                

               public PageReference cancel(){
                 pageReference pageref = new ApexPages.StandardController(o).view();
                  pageref.setRedirect(true);
                    return pageref;
                  }  
                   
               public PageReference save(){
                
                 a.phone=c.phone;
                  insert a;
                   
                    c.accountId= a.Id;
                     insert c;
                      
                       o.accountId= a.Id;
                       insert o;
                       
                      /*  r.opportunityId=O.Id;
                        r.ContactId=c.ID;
                        insert r; */
                         
                 pageReference pgref = new ApexPages.StandardController(o).view();
                  pgref.setRedirect(true);
                   return pgref;
                }
                 
                                   
                           
 
  }