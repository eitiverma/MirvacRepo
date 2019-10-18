@isTest
public class MaintenanceRequestTest {
    
    @isTest  static void testMaintenanceRequest(){
        
        List<Case> maintenanceList=new List<Case>();
        List<Case> maintenanceListAfterClosed=new List<Case>();
        Vehicle__c vehicle=new Vehicle__c(Name='tata sumo',Air_Conditioner__c=true,Model__c='23Test');
        insert vehicle;
        Product2 equipment=new Product2(Name='tire',Cost__c=100,Current_Inventory__c    =10,Replacement_Part__c=true,
                                        Warehouse_SKU__c ='test',Lifespan_Months__c =10,Maintenance_Cycle__c=10);
        insert equipment;
        for(Integer  i=1;i<=300;i++){
            Case maintenance=new Case(Subject='Test subject'+i,Type='Routine Maintenance'+i,Status='New'+i,
                                      Origin='Phone'+i,Equipment__c=equipment.Id,Vehicle__c=vehicle.Id);
            maintenanceList.add(maintenance);
        }
        insert maintenanceList;
        // system.assertEquals(300, maintenanceList.size());
        for(Case caseupdate:maintenanceList){
            caseupdate.Status='Closed';
            caseupdate.Type='Routine Maintenance';
            caseupdate.Date_Due__c=date.Today().addDays(Integer.valueOf(equipment.Maintenance_Cycle__c));
            maintenanceListAfterClosed.add(caseupdate);
        }
        Test.startTest();
        //UPDATE  maintenanceListAfterClosed;
        //Bulk insert update
        Database.SaveResult[] updatequipment = Database.update(maintenanceListAfterClosed);
        Test.stopTest();
        for(Database.SaveResult sa:updatequipment){
            System.assert(sa.isSuccess());}
    }
    
}