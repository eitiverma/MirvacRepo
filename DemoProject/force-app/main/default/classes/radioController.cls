public class radioController{

   
Sobject a{get;set;}

public radioController(){}
public radioController(ApexPages.StandardController cntr){
    a= cntr.getRecord(); 
}

public pageReference Submit(){
PageReference pg= new PageReference('/apex/radioReadpg?id:a.id');
return pg;
}
}