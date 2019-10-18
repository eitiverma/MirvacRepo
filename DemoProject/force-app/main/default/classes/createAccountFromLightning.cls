public class createAccountFromLightning {
	@AuraEnabled
    public static ErrorWrapper CreateAccount(Account acc){
        try{
            ErrorWrapper objWrap = new ErrorWrapper();
            if(acc!=null){
                //insert acc;
                list<Account>lstAcc = [Select name,phone from Account];
                objWrap.isSuccess = true;
                objWrap.successMsg = 'Record Saved Successfully';
                objWrap.lstacc = lstAcc;
            }
            return objWrap;
        }
        catch(Exception ex){
            ErrorWrapper objWrap = new ErrorWrapper();
            objWrap.isSuccess = false;
            objWrap.errorMsg = 'Error From Apex '+ex.getMessage();
            return objWrap;
        }
        
    }
    
    public class ErrorWrapper{
        @AuraEnabled public boolean isSuccess;
        @AuraEnabled public string errorMsg;
        @AuraEnabled public string successMsg;
        @AuraEnabled public list<account> lstacc;
        ErrorWrapper(){
            isSuccess = false;
            errorMsg = '';
            successMsg = '';
            lstacc = new list<account>();
        }
     }
}