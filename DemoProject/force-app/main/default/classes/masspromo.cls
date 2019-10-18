public class masspromo
{ 
    public masspromo(ApexPages.StandardController controller) {

    }


 public set<id> s{get;set;}
public list<SObject> lst;
 
public masspromo(Apexpages.StandardSetController controller){

    
if(this.lst==null)
{ 
  this.lst=(list<sobject>)controller.getselected();
  }
  s=new set<id>();
  for(sobject so:lst)
  {
    s.add(so.id);
  }
  

}
  public pagereference mass()
  {

 list<Prelead__c> l = [select first_name__c,last_name__c,company__c,email__c,phone__c,website__c from prelead__c where id=:s];
 integer a = 0;for(prelead__c li:l){
  lead lea = new lead();
  lea.firstname=l.get(a).first_name__c;
  lea.lastname=l.get(a).last_name__c;
  lea.company=l.get(a).company__c;
  lea.email=l.get(a).email__c;
  lea.website=l.get(a).website__c;
  lea.phone=l.get(a).phone__c;
  insert lea;
  a++;
 }
pagereference pref = new pagereference('/00Q/o');
 
 return pref;
}
}