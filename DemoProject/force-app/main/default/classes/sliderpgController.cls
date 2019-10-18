public class sliderpgController extends pgControllerBase
{
    public sliderCompCntrl cmpslider{get;set;}
   
    
    
   
    public sliderpgController()
     {
        objSecurityLevelIn = objaircraft.Flight_type__c == null ? new stringCarrier(''):new stringCarrier(objaircraft.Flight_type__c);     
        objLegendDataSecurityLevel = new stringCarrier('use the slider');     
     }   
    public override void setsliderComponentController(CompControllerBase compcontroller){
    if(compcontroller instanceOf sliderCompCntrl) 
     {
        cmpslider = (sliderCompCntrl)compcontroller;     
     } 
    }
     
    public override CompControllerBase getSliderComponentController()
     {
        return cmpslider;     
     }  
      
}