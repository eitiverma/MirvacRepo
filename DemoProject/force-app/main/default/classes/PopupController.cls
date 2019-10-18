Public class PopupController{

    public list<Employee__c> lstemp {get;set;}
    public string namevalue{get;set;}
    public boolean displaypopup{get;set;}
    public boolean showlist{get;set;}
    public Employee__c bm{get;set;}
    
    public PopupController(){
    showlist = false;
    }
    
    public pageReference listOfEmployees(){
      showlist = true;
      lstemp = new list<Employee__c>();
      lstemp = [Select Name,Ename__c,total_arrival__c from Employee__c];  
      return null;
    }
    
    public pagereference hideList(){
        showlist = false;
        return null;
    }
     public PageReference save() {
     Employee__c bm = new Employee__c();
     bm.Ename__c = namevalue;
     insert bm;
        return null;
    }

     public void showpopup()
     {
      displaypopup = true;
      } 
     public void hidepopup()
      {
        displaypopup = false;      
      }
}