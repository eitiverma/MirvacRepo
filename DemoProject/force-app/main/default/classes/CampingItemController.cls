public class CampingItemController {
	
    @AuraEnabled 
    public static ErrorWrapper createCampingItem(CanvasApp26__Camping_Item__c camping){
        try{
            ErrorWrapper objWrap = new ErrorWrapper();
            list<campingWrapper> lstCampingWrapper = new list<campingWrapper>();
            if(camping!=null){
                insert camping;
                for(CanvasApp26__Camping_Item__c eachCamping : [Select id,name,CanvasApp26__Packed__c,CanvasApp26__Price__c,CanvasApp26__Quantity__c from CanvasApp26__Camping_Item__c]){
                     campingWrapper objCampingWrap = new campingWrapper();
                     objCampingWrap.isSelected = false;
                     objCampingWrap.objCamping = eachCamping;
                     lstCampingWrapper.add(objCampingWrap);
                }
                objWrap.isSuccess = true;
                objWrap.lstCamping = lstCampingWrapper;
                objWrap.successMsg = 'Record Saved Successfully';
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
    
    @AuraEnabled
    public static list<campingWrapper> fetchCampingItems(){
        
        list<campingWrapper> lstCampingWrapper = new list<campingWrapper>();
        for(CanvasApp26__Camping_Item__c eachCamping : [Select id,
                                                                   name,
                                                                   CanvasApp26__Packed__c,
                                                                   CanvasApp26__Price__c,
                                                                   CanvasApp26__Quantity__c 
                                                                   from CanvasApp26__Camping_Item__c]){
                 campingWrapper objCampingWrap = new campingWrapper();
                 objCampingWrap.isSelected = false;
                 objCampingWrap.objCamping = eachCamping;
                 lstCampingWrapper.add(objCampingWrap);                                                      
             } 
        
         return lstCampingWrapper;
    }
    
    @AuraEnabled
    public static ErrorWrapper deleteCampingRecords(string strCamping){
        system.debug('strCamping====== '+strCamping);
        list<campingWrapper> lstCamping = (list<campingWrapper>)JSON.deserialize(strCamping,list<campingWrapper>.class);
        system.debug('lstCamping====== '+lstCamping);
        try{
            list<CanvasApp26__Camping_Item__c> delCampingList = new list<CanvasApp26__Camping_Item__c>();
            list<campingWrapper> fnlListCampingWrapper = new list<campingWrapper>();
            if(lstCamping!=null && lstCamping.size()>0){
                for(campingWrapper eachCampingWrap : lstCamping){
                    if(eachCampingWrap.isSelected == true){
                        delCampingList.add(eachCampingWrap.objCamping);
                    }
                    else{
                        fnlListCampingWrapper.add(eachCampingWrap);
                    }
                }
            }
             system.debug('delCampingList====== '+delCampingList);
            if(delCampingList!=null && delCampingList.size()>0)
                delete delCampingList;
            ErrorWrapper objWrap = new ErrorWrapper();
            objWrap.isSuccess = true;
            objWrap.lstCamping = fnlListCampingWrapper;
            objWrap.successMsg = 'Deleted Successfully';
            return objWrap;
        }
        catch(Exception ex){
            ErrorWrapper objWrap = new ErrorWrapper();
            objWrap.isSuccess = false;
            objWrap.errorMsg = 'Error From Apex '+ex.getMessage();
            return objWrap;
        }
    }
   
    //wrapper class to show error message
    public class ErrorWrapper{
        @AuraEnabled public boolean isSuccess;
        @AuraEnabled public string errorMsg;
        @AuraEnabled public string successMsg;
        @AuraEnabled public list<campingWrapper> lstCamping;
        ErrorWrapper(){
            isSuccess = false;
            errorMsg = '';
            successMsg = '';
            lstCamping = new list<campingWrapper>();
        }
     }
}