public class ProductBundleCntr {
	public ProductBundleCntr(){}
    @AuraEnabled
    public static list<prodWrapper> searchProdBundle(string strName){
        list<prodWrapper> lstProdWrapper = new list<prodWrapper>();
        if(strName!=''){
            map<Id,Product2> mapOfBundleProductIdVsProduct = new map<Id,Product2>();
            map<Id,List<Id>> mapOfBundleProductIdVsListChildProduct = new map<Id,List<Id>>();
            set<Id> setofProductId = new set<Id>();
            map<Id,string> mapOfChildProdIdVsName = new map<Id,string>();
            map<Id,PriceBookEntry> mapOfProdIDVsListPrice = new map<Id,PriceBookEntry>();
            
            //collect all bundle products
            for(Product2 eachProd : Database.query('select Id,Name from Product2 where CanvasApp26__Is_Product_Bundle__c = true AND (Name Like :strName OR Name Like \'%'+strName+'%\''+')')){
                mapOfBundleProductIdVsProduct.put(eachProd.id,eachProd);
            }
            system.debug('mapOfBundleProductIdVsProduct===== '+mapOfBundleProductIdVsProduct);
            //collect all child products 
            if(mapOfBundleProductIdVsProduct!=null && mapOfBundleProductIdVsProduct.size()>0){
                setofProductId.addAll(mapOfBundleProductIdVsProduct.keyset());
                for(CanvasApp26__Product_Bundle_Master__c eachMaster : [Select id,CanvasApp26__Product__c,
                                                                        CanvasApp26__Product__r.name,
                                                                        CanvasApp26__Product_Bundle__c
                                                                        from CanvasApp26__Product_Bundle_Master__c 
                                                                        where CanvasApp26__Product_Bundle__c 
                                                                        IN:mapOfBundleProductIdVsProduct.keyset()]){
                    setofProductId.add(eachMaster.CanvasApp26__Product__c);
                    mapOfChildProdIdVsName.put(eachMaster.CanvasApp26__Product__c,eachMaster.CanvasApp26__Product__r.name);
                    if(!mapOfBundleProductIdVsListChildProduct.containsKey(eachMaster.CanvasApp26__Product_Bundle__c)){
                        mapOfBundleProductIdVsListChildProduct.put(eachMaster.CanvasApp26__Product_Bundle__c,new list<Id>());
                    }  
                    mapOfBundleProductIdVsListChildProduct.get(eachMaster.CanvasApp26__Product_Bundle__c).add(eachMaster.CanvasApp26__Product__c);                                                        
                }
            }
            system.debug('mapOfChildProdIdVsName===== '+mapOfChildProdIdVsName);
            system.debug('setofProductId===== '+setofProductId);
            //collect pricebook record
            list<Pricebook2> lstPriceBook = [SELECT Id,IsActive FROM Pricebook2 where IsActive = true limit 1];
            system.debug('lstPriceBook===== '+lstPriceBook);
            if(lstPriceBook!=null && lstPriceBook.size()>0 && setofProductId!=null && setofProductId.size() >0){
                //collect the list price from price book entry
                for(pricebookentry eachpricebookentry : [select id,UnitPrice,Product2Id from pricebookentry where Pricebook2Id=:lstPriceBook[0].id and Product2Id IN:setofProductId]){
                    mapOfProdIDVsListPrice.put(eachpricebookentry.Product2Id,eachpricebookentry);
                }
            }
            system.debug('mapOfProdIDVsListPrice===== '+mapOfProdIDVsListPrice);
            //fill the data in wrapper
            if(mapOfBundleProductIdVsListChildProduct!=null && mapOfBundleProductIdVsListChildProduct.size()>0){
                for(Id eachProdId : mapOfBundleProductIdVsListChildProduct.keyset()){
                    //check that product is bundle product or not
                    if(mapOfBundleProductIdVsProduct.size()>0 && mapOfBundleProductIdVsProduct.containsKey(eachProdId)){
                        Product2 prod = mapOfBundleProductIdVsProduct.get(eachProdId);
                        prodWrapper objProdWrap = new prodWrapper();
                        objProdWrap.prodName = prod.name;
                        objProdWrap.isSelected = true;
                        objProdWrap.qty = 1;
                        objProdWrap.discount = 0;
                        objProdWrap.isBundle = true;
                        objProdWrap.prodId = eachProdId;
                        if(mapOfProdIDVsListPrice.size()>0 && mapOfProdIDVsListPrice.containsKey(eachProdId)){
                            objProdWrap.listPrice = mapOfProdIDVsListPrice.get(eachProdId).UnitPrice;
                        	objProdWrap.salesprice = mapOfProdIDVsListPrice.get(eachProdId).UnitPrice;
                        }
                        lstProdWrapper.add(objProdWrap);
                        
                        if(mapOfBundleProductIdVsListChildProduct.get(eachProdId)!=null && mapOfBundleProductIdVsListChildProduct.get(eachProdId).size()>0){
                            for(Id eachChildProdId : mapOfBundleProductIdVsListChildProduct.get(eachProdId)){
                                prodWrapper objProdChildWrap = new prodWrapper();
                                if(mapOfChildProdIdVsName.size()>0 && mapOfChildProdIdVsName.containsKey(eachChildProdId)){
                                    objProdChildWrap.prodName = mapOfChildProdIdVsName.get(eachChildProdId);
                                }
                                objProdChildWrap.isSelected = true;
                                objProdChildWrap.qty = 1;
                                objProdChildWrap.discount = 0;
                                objProdChildWrap.isBundle = false;
                                objProdChildWrap.prodId = eachChildProdId;
                                objProdChildWrap.bundleProdId = eachProdId;
                                if(mapOfProdIDVsListPrice.size()>0 && mapOfProdIDVsListPrice.containsKey(eachChildProdId)){
                                    objProdChildWrap.listPrice = mapOfProdIDVsListPrice.get(eachChildProdId).UnitPrice;
                                    objProdChildWrap.salesprice = mapOfProdIDVsListPrice.get(eachChildProdId).UnitPrice;
                                }
                                lstProdWrapper.add(objProdChildWrap);
                            }
                        }
                    }
                }
            }
            
        }
         system.debug('lstProdWrapper===== '+lstProdWrapper);
        return lstProdWrapper;
    }
    
    @AuraEnabled 
    public static void saveProdData(string strProdlist,Id OppId){
        system.debug('strProdlist======= '+strProdlist);
        map<Id,PriceBookEntry> mapOfProdIDVsListPrice = new map<Id,PriceBookEntry>();
        list<OpportunityLineItem> lstOppLineItem = new list<OpportunityLineItem>();
        map<Id,PriceBookEntry> mapOfProdIDVsPriceEntry = new map<Id,PriceBookEntry>();
        set<Id> setofProductId = new set<Id>();
        list<prodWrapper> lst = (list<prodWrapper>)JSON.deserialize(strProdlist, list<prodWrapper>.class);
         system.debug('lst===== '+lst);
        if(lst!=null){
            for(prodWrapper eachWrap : lst){
                if(eachWrap.isSelected){
                    setofProductId.add(eachWrap.prodId);
                }
            }
            system.debug('setofProductId===== '+setofProductId);
            //collect pricebook record
            list<Pricebook2> lstPriceBook = [SELECT Id,IsActive FROM Pricebook2 where IsActive = true limit 1];
            system.debug('lstPriceBook===== '+lstPriceBook);
            if(lstPriceBook!=null && lstPriceBook.size()>0 && setofProductId!=null && setofProductId.size() >0){
                //collect the list price from price book entry
                for(pricebookentry eachpricebookentry : [select id,UnitPrice,Product2Id from pricebookentry where Pricebook2Id=:lstPriceBook[0].id and Product2Id IN:setofProductId]){
                    mapOfProdIDVsListPrice.put(eachpricebookentry.Product2Id,eachpricebookentry);
                }
            }
            system.debug('mapOfProdIDVsListPrice======= '+mapOfProdIDVsListPrice);
        
            for(prodWrapper eachWrap : lst){
                if(eachWrap.isSelected){
                    OpportunityLineItem eachItem = new OpportunityLineItem();
                    eachItem.OpportunityId = OppId;
                    eachItem.PricebookEntryId = mapOfProdIDVsListPrice.get(eachWrap.prodId).id;
                    eachItem.Quantity = eachWrap.qty;
                    eachItem.UnitPrice = eachWrap.salesprice;
                    eachItem.discount = eachWrap.discount;
                    if(eachWrap.isBundle == false)
                        eachItem.CanvasApp26__Product_Bundle__c = eachWrap.bundleProdId;
                    lstOppLineItem.add(eachItem);
                }
            }
        }
        
        system.debug('lstOppLineItem======= '+lstOppLineItem);
        if(lstOppLineItem!=null && lstOppLineItem.size()>0)
            insert lstOppLineItem;
    }
}