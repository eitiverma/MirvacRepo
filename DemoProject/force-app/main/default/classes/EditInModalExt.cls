public class EditInModalExt{

     public string inputvalue{get;set;}
     public string p1{get;set;}
    public Account acnt{get;set;}
    public string p2{get;set;}
    public list<account>lstacc{get;set;}
    
    public EditInModalExt (){}
    
    public EditInModalExt(ApexPages.StandardSetController controller) {
     system.debug('+++ ID VALUE +++++'+inputvalue);
    
    }
     public void Editrecord1()
    {
        //inputValue = ApexPages.currentPage().getParameters().get('p1');

        system.debug('+++ ID VALUE 1+++++'+inputvalue);
        acnt = [Select name,phone,type,billingstate from Account where id=:inputvalue];
        system.debug('=== LIST ==='+acnt);
        
       //return null;
        
        
    }
    public void detailrecord()
    {
        system.debug('+++ GGGGG +++'+inputvalue);
        acnt = [Select name,phone,type,billingstate from Account where id=:inputvalue];
       system.debug('=== LIST ==='+acnt);
       // return null;
    }
    
    
   /* public EditInModalExt() {
         lstacc = new list<account>();
     lstacc = [Select id,name,phone,type,billingstate from Account];
    } */
    
   
}