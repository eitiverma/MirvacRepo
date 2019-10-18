public class ImageInsertCntr{
public string img{get;set;}

public Stage__c obj;
public Attachment objattach;
public blob image{get;set;}

public list<selectoption> lst;

    public ImageInsertCntr(ApexPages.StandardController cntr)
    {
      //obj = new stage__c();
        obj=(Stage__c)cntr.getRecord();      
    }
    
    public list<selectOption> getOptions()
    {
        lst = new list<selectOption>();
        lst.add(new selectOption('Dev','Dev'));
        lst.add(new selectOption('QA','QA'));
        lst.add(new selectOption('Defect','Defect'));
        lst.add(new selectOption('Requirement','Requirement'));
        lst.add(new selectOption('Design','Design'));
        lst.add(new selectOption('UAT','UAT'));
        
        return lst;
        
    }
    public pageReference Save()
    {
        //system.debug('=== VAL ==='+type);
        //obj.type__c = type;
        insert obj;
     
       
       objattach = new Attachment(parentId=obj.id, name='a', body=image);
       insert objattach;
       return null; 
    }
    
    public pagereference cancel()
    {
        return(new pagereference('/apex/ImageInsertPage'));
    }
}