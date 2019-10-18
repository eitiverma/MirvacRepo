public class radioext{
Account a{get;set;}
 
    public PageReference savee() {
    a = new Account();
    
    system.debug('VALUEEE'+theValue);
    
     a.check__c =theValue;
    
    a.name='ttrrruu';
    insert a;
        return null;
    }

public boolean theValue{get;set;}
}