public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(){
        // update workorders
        //bulk determine
        List<Case>maintenanceRequestList=[select id,case.Vehicle__c,Equipment__c,Equipment__r.Maintenance_Cycle__c,Type,Status  from case where id in :Trigger.New limit 200];
        if(maintenanceRequestList !=null && maintenanceRequestList.size()>0 ){
            List<Case> insertMaintenanceRequest=getCaseList(maintenanceRequestList);
            insert insertMaintenanceRequest;
        }
        
        
    }
    
    public static List<Case> getCaseList(List<Case> maintenanceRequestList){
        List<Case>newMaintenanceRequestList=new List<Case>();
        for(Case cas:maintenanceRequestList){
            if(cas.Type=='Routine Maintenance' &&  cas.Status=='Closed'){
                case newMaintenanceRequest=new Case();
                newMaintenanceRequest.Subject='test';
                newMaintenanceRequest.Type='Routine Maintenance';
                newMaintenanceRequest.Vehicle__c=cas.Vehicle__c;
                newMaintenanceRequest.Equipment__c=cas.Equipment__c;
                newMaintenanceRequest.Date_Reported__c=date.Today();
                newMaintenanceRequest.Date_Due__c=Date.today().addDays(Integer.valueOf(cas.Equipment__r.Maintenance_Cycle__c));
                newMaintenanceRequest.Status='New';
                newMaintenanceRequest.Origin='Phone';
                newMaintenanceRequestList.add(newMaintenanceRequest);
            }
        }
        return newMaintenanceRequestList;
    }
    
    public static void updateOwner(list<Case> triggerNew, map<Id,Case> triggerOld){
        list<Case> lstCase = new list<Case>();
        for(Case eachCase : triggerNew){
            if(eachCase.OwnerID != triggerOld.get(eachCase.Id).OwnerID){
                Case newCase = new Case(status = 'Open',Id = eachCase.Id);
                lstCase.add(newCase);
            }
        }
        update lstCase;
    }
    
}