public class aaExtension{

   
    // update
    public aaExtension(ApexPages.StandardController controller) {

    }
     List<SelectOption> options = new List<SelectOption>(); 
      public Integer i;
    
    public list<selectOption> getSelPicklist(){
   
         
        
        datetime dt = system.now();
        
        system.debug('VALUE'+dt);       
        Schema.DescribeFieldResult field = Account.SLA__c.getDescribe();
        list<Schema.PicklistEntry> lst2 = field.getPicklistValues();
        for (Schema.PicklistEntry f : lst2){
            options.add(new SelectOption(f.getLabel(), f.getValue())); 
            
        }
           
        return options;     

         
        }
        
        public Integer getlistSize(){
        i = options.size();
            return i;
        }
    }