public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout=true)
    public static void runWarehouseEquipmentSync(){
        
        HttpResponse response = getrespond();
        
        if(response.getStatusCode()==200){
            //System.debug('sizeequipment--'+equipmentlist.size());
            List<Product2> updateEquipmentlist=getProductlist(response);
            if(updateEquipmentlist.size() > 0){
                insert updateEquipmentlist;
            }
        }
        
    }
    
    public static List<Product2> getProductlist(HttpResponse response){
        
        List<Object> externalEquipment = (List<Object>) JSON.deserializeUntyped(response.getBody());
        List<Product2> equipmentlist=new List<Product2>();
        //System.debug('sizeresult'+externalEquipment.size());
        for (Object externalEquipment1: externalEquipment) {
            Map<String,Object> data = (Map<String,Object>)externalEquipment1;
            //system.debug(externalEquipment1);
            //system.debug(data+'==='+data.get('cost
            Product2 equipment=new Product2();
            // equipment.Id =(String)data.get('_id
            equipment.Cost__c=(Integer)data.get('cost');
            equipment.Lifespan_Months__c =(Integer)data.get('lifespan');
            equipment.Maintenance_Cycle__c =(Integer)data.get('maintenanceperiod');
            equipment.Name =(String)data.get('name');
            equipment.Current_Inventory__c =(Integer)data.get('quantity');
            equipment.Replacement_Part__c =(Boolean)data.get('replacement');
            equipment.Warehouse_SKU__c=(String)data.get('sku');
            equipmentlist.add(equipment);
        }
        return equipmentlist;
    }
    
    public static HttpResponse getrespond(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse res=Http.send(request);
        return res;
    }
    
    

}