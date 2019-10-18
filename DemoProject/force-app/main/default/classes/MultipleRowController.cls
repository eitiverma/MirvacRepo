public class MultipleRowController {
   //public static list<clsMultipleRowWrapper> lstWrap = new list<clsMultipleRowWrapper>(); 
    @auraEnabled
        public static list<clsMultipleRowWrapper> getWrapList(string Name,string Type,string wrapperRoWList){
            system.debug('wrapperRoWList111========= '+wrapperRoWList);
            list<clsMultipleRowWrapper> lstWrap = new list<clsMultipleRowWrapper>(); 
            clsMultipleRowWrapper[] lstValues = (List<clsMultipleRowWrapper>)System.JSON.deserializeStrict(wrapperRoWList, List<clsMultipleRowWrapper>.Class);
            if(lstValues.size()>0){         
                for (clsMultipleRowWrapper eachWrap : lstValues) {
                    eachWrap.isDisableAddBtn = true;
                    lstWrap.add(eachWrap);
                }
            }
            /*if(!String.isBlank(wrapperRoWList)){
                lstWrap = (list<clsMultipleRowWrapper>)System.JSON.deserializeUntyped(wrapperRoWList);
				if(lstWrap!=null && lstWrap.size()>0){
                    for(Integer i=0; i<lstWrap.size(); i++){
                        lstWrap[i].isDisableAddBtn = true;
                    }
            	}
            }*/
           
            clsMultipleRowWrapper objwrap = new clsMultipleRowWrapper(Name,Type,false);
            lstWrap.add(objwrap);
            //wrapperRoWList.addAll(lstWrap);
            system.debug('wrapperRoWList4444========= '+lstWrap);
            return lstWrap;
        }
 }