public class createContactCntr {
	
    @AuraEnabled
    public static ErrorWrap createCon(Contact con){
        try{
            if(con!=null){
                insert con;
            }
            ErrorWrap obj = new ErrorWrap();
            obj.isSuccess = true;
            obj.message = 'Contact created successfully';
            return obj;
        }
        catch(Exception ex){
            ErrorWrap obj = new ErrorWrap();
            obj.isSuccess = false;
            obj.message = ex.getMessage();
            return obj;
        }
    }
    
    @AuraEnabled
    public static list<Contact> contactListView(){
        return [Select id,FirstName,LastName,Email from Contact];
    }
    public class ErrorWrap{
        @AuraEnabled public boolean isSuccess;
        @AuraEnabled public string message;
        public ErrorWrap(){
            isSuccess = false;
            message = '';
        }
    }
}