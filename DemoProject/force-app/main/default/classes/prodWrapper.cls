public class prodWrapper{
        @AuraEnabled public string prodName;
        @AuraEnabled public boolean isSelected;
        @AuraEnabled public decimal listPrice;
        @AuraEnabled public decimal qty;
        @AuraEnabled public decimal salesprice;
        @AuraEnabled public decimal discount;
        @AuraEnabled public boolean isBundle;
        @AuraEnabled public Id prodId;
    	@AuraEnabled public Id bundleProdId;
        
        public prodWrapper(){
            prodName = '';
            isSelected = true;
            listPrice = 0;
            qty = 0;
            salesprice = 0;
            discount = 0;
            isBundle = false;
        }
}