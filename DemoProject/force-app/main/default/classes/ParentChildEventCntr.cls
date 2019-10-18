public class ParentChildEventCntr {
    public ParentChildEventCntr(){}
   
    @AuraEnabled
        public static list<Account> getAllAcnt(){
            return [Select id,name from Account];
        }
}