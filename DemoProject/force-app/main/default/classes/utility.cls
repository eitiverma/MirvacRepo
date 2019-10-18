global with sharing class utility
{

 public class wrapSecurityLevel
 {
      public list<wrapperPickval>lstAvailableOptions{get;set;}
      public integer iSelectedLevel{get;set;}
      public integer iTotal{get;set;}
      public string strSelectedLevel{get;set;}
     public wrapSecurityLevel()
     {
     
     }
 
 
 public wrapSecurityLevel(Schema.sobjectfield sField, string strSlin)
 {
     iSelectedLevel= 0;
     lstAvailableOptions = new list<WrapperPickval>();
     strSelectedLevel = strSlin;
     Schema.DescribefieldResult fldResult = sField.getDescribe();
     
     if(fldResult.getType()== Schema.Displaytype.Picklist)
     {
          transient integer icounter= 1; 
          for(Schema.PicklistEntry each : fldResult.getPicklistValues())
          {
              if(each.isActive())
              {
                  transient boolean bselected = (strSlin !=null && strSlin.equalsIgnoreCase(each.getValue())?true:false);
                  lstAvailableOptions.add(new WrapperPickVal(icounter,each.getValue(),bselected));
                  if(bselected)
                  {
                      iselectedLevel = iCounter;
                  }
                  iCounter++;
              }
          }
          
          iTotal = lstAvailableOptions.size();
     }
 }   
 }
 public class WrapperPickVal
 {
     public integer iCount{get;set;}
      public integer iFlag {get;set;}
     public string uniqueName{get;set;}
     public string ValLabel{get;set;}
     public WrapperPickVal(integer iCin, string val , boolean bSelln)
     {
         this.iCount = iCin;
         this.ValLabel = val;
         this.iFlag = bSelln?1:0;
         this.uniqueName = val!=null?val.deleteWhitespace().replace('/',''):val;
     }
 }
}