public with sharing class sliderCompCntrl extends CompControllerBase
{
    public stringCarrier objWrapMode{get;set;}
    public stringCarrier objSelValue{get;set;}
    public stringCarrier objLegend{get;set;}
    
    public string strMode{get;set;}
    public integer iMin{get;set;} 
    public integer iMax{get;set;} 
     public integer iSel{get;set;} 
      public integer iSelectedLevelParam{get;set;}  
    public string strLegend{get;set;}
    
    private string strHiddenData;
     
      public utility.WrapSecurityLevel objsecurityLevel{get;set;}
       
    private void performBasicInitilization()
     {
        if(objsecurityLevel == null)
         {
           objsecurityLevel = new utility.WrapSecurityLevel(Schema.Aircraft__c.Flight_type__c,objSelValue.value);
            iMin=1;
            iMax= objsecurityLevel.iTotal;
            iSel = objsecurityLevel.iSelectedLevel;
            
            iSelectedLevelParam = iSel;
            strMode = objWrapMode.value;
            strLegend = objLegend.value; 
             
         }    
     } 
        
       public string getHiddenData()
        {
           performBasicInitilization();
            return strHiddenData;        
        } 
         
        public void setHiddenData(string value)
         {
            strHiddenData = 'some data';         
         } 
}