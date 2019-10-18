public class LightningAccController {
	@AuraEnabled
    public static List<AccWrapper> getAccounts() {
		list<AccWrapper> lstAccWrapper = new list<AccWrapper>();
        //return [SELECT Id, Name, CanvasApp26__Active__c, AccountNumber FROM Account];
        // Perform isAccessible() check here
        for(Account eachAcc : [SELECT Id, Name, CanvasApp26__Active__c, AccountNumber
                               FROM Account]){
                                   AccWrapper objAccWrapper = new AccWrapper(true,eachAcc);
                                   lstAccWrapper.add(objAccWrapper);
                               }
        return lstAccWrapper;
    }
    
    @AuraEnabled
    public static list<AccWrapper> saveAccount(Account acc) {
    
        // Perform isUpdateable() check here
        //upsert expense;
        system.debug('acc========= '+acc);
        insert acc;
        return getAccounts();
    }
    @AuraEnabled
    public static Account updateAccount(Account acc) {
    
        // Perform isUpdateable() check here
        //upsert expense;
        system.debug('acc========= '+acc);
        //system.debug('accId========= '+accId);
        //acc.id = accId;
        update acc;
        return acc;
    }
    
     @AuraEnabled
    public static list<AccWrapper> delAccount(Account selectedacc) {
        system.debug('selectedacc==== '+selectedacc);
        if(selectedacc!=null && selectedacc.id!=null){
            delete selectedacc;
            return getAccounts();
        }
        return null;	
   }
    
     @AuraEnabled
    public static list<AccWrapper> AddNewRow(list<AccWrapper> lstAccWrap){
        if(lstAccWrap!=null && lstAccWrap.size()>0){
            Account acc = new Account();
           AccWrapper objAccWrap = new AccWrapper(false,acc);
           lstAccWrap.add(objAccWrap); 
        }
        return lstAccWrap;
    }
    
    public class AccWrapper{
        @auraEnabled public boolean isDelete;
        @auraEnabled public Account acc;
        
        public AccWrapper(boolean isDel,Account account){
            this.isDelete = isDel;
            this.acc = account;
            
        }
    }
}