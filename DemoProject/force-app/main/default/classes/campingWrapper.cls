//wrapper to show camping data with checkbox
    public class campingWrapper{
    	@AuraEnabled public boolean isSelected;
        @AuraEnabled public CanvasApp26__Camping_Item__c objCamping;
        public campingWrapper(){
            isSelected = false;
            objCamping = new CanvasApp26__Camping_Item__c();
        }
    }