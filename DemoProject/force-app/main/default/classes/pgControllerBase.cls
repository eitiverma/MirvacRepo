public with sharing virtual class pgControllerBase{
public Account objevent{get;set;}
public Aircraft__c objaircraft{get;set;}
public stringCarrier objsliderIn{get;set;}
 public stringCarrier objSecurityLevelIn {get;set;} 
  public stringCarrier objLegendDataSecurityLevel{get;set;} 
public stringCarrier objLegendDataSliderLevel{get;set;}

    public pgControllerBase getthis(){
        return this;
        }
        public pgControllerBase()
        {
        objaircraft = new Aircraft__c();
        objevent=new Account();
        objevent=[select id,name,SLAExpirationDate__c,Type from account limit 1];
        }
        
        private CompControllerBase objSlidercomponentCntrl;
         
        public virtual CompControllerBase getSliderComponentController()
         {
            return objSlidercomponentCntrl;        
         } 
          
        public virtual void setsliderComponentController(CompControllerBase compcontroller) 
        {
           objSlidercomponentCntrl = compController;         
        }        

}