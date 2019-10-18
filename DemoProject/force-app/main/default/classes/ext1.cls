public class ext1 extends SuperClass1 {
    
    public string val {get;set;}
    public ext1(ApexPages.StandardController controller) {

    }
    
    
    public void returnValue(){
        system.debug('check this value----'+testValue);
    }
    
    
    public void callMe(){
        system.debug('check this value----'+testValue);
        val  = testValue;
        
        test();
    }
    
}