public class searchController {
	
    @AuraEnabled
    public static list<ObjectWrapper> fetchObjectNames(){
        list<ObjectWrapper> lstWrapper = new list<ObjectWrapper>();
        map<string,string> mapOfLabelVsApiName = new map<string,string>();
        mapOfLabelVsApiName.put('Account','Account');
        mapOfLabelVsApiName.put('Contact','Contact');
        mapOfLabelVsApiName.put('Opportunity','Opportunity');
        //for ( Schema.SObjectType o : Schema.getGlobalDescribe().values() )
        for(string strLabel : mapOfLabelVsApiName.keyset())
        {
            //Schema.DescribeSObjectResult objResult = o.getDescribe();
            ObjectWrapper objwrap = new ObjectWrapper();
            objwrap.isChecked = false;
            //objwrap.label = objResult.getLabel();
            //objwrap.apiName = objResult.getName();
            objwrap.label = strLabel;
            objwrap.apiName = mapOfLabelVsApiName.get(strLabel);
            lstWrapper.add(objwrap);  
        }
        return lstWrapper;
    } 
    
    @AuraEnabled 
    public static list<SObject> fetchRecords(string searchKeyword,string strWrapper){
        list<ObjectWrapper> lstWrapper = (list<ObjectWrapper>)JSON.deserialize(strWrapper, list<ObjectWrapper>.class);
        
        //Program To Search the given string in all Object
        //List to hold the returned results of sObject generic type
        List<list<SObject>> recordSearchList = new List<List<SObject>>();
        list<SObject> lstObject = new list<SObject>();
        string str = '';
            
        if(lstWrapper!=null && lstWrapper.size()>0){
            for(ObjectWrapper eachWrap : lstWrapper){
                if(eachWrap.isChecked && str=='')
                	str = eachWrap.apiName+'(id,name)';
                else if(eachWrap.isChecked && str !='')
                    str += ','+eachWrap.apiName+'(id,name)';
            }
        }
        //SOSL query which will search for 'ABC' string in Customer Name field of Invoice Object
        String searchquery='FIND '+'\''+searchKeyword+'*\' IN ALL FIELDS RETURNING '+ str; 
		recordSearchList =search.query(searchquery); 
        system.debug('recordSearchList====== '+recordSearchList);
        if(recordSearchList!=null){
            for(integer i =0;i< recordSearchList.size();i++){
                lstObject.addAll(recordSearchList[i]);
            }
        }
        system.debug('lstObject======== '+lstObject);
		return lstObject;
    }
    
    public class ObjectWrapper{
        @AuraEnabled public boolean isChecked;
        @AuraEnabled public string label;
        @AuraEnabled public string apiName;
        
        public ObjectWrapper(){
            isChecked = false;
            label = '';
            apiName = '';
        }
    }
}