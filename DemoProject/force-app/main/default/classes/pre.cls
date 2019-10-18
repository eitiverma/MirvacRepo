public class pre
{
     public string operators{get;set;}
        public pre(ApexPages.StandardController controller) {
     
                  
                 }
                 
    

 public pagereference promote()
 {
   Id recordId = System.currentPagereference().getParameters().get('Id');

 List<Prelead__c> lst=[Select Id ,company__c, email__c, First_name__c, last_name__c, phone__c, website__c from Prelead__c where id =:recordId];

// if(lst.size()>0){

   lead ld =new lead();
 /* pre1__c p = new pre1__c();
  p.fname__c=lst.get(0).First_name__c;
  p.lname__c=lst.get(0).Last_name__c;
  insert p;*/

   ld.email= lst.get(0).email__c;

    ld.website=lst.get(0).website__c;
   ld.company=lst.get(0).company__c;
  ld.FirstName=lst.get(0).First_name__c;
    ld.LastName=lst.get(0).Last_name__c;
    ld.phone=lst.get(0).phone__c;
    insert ld;
    return null;
   // }

   }
 }