public class DynamicController{
        
                    
 public DynamicController(ApexPages.StandardController cntr) {
cntr.addFields(editableFields);
            }
            
        public list<string> editableFields{
            get {
                 if(editableFields==null){
                      editableFields = new List<string>();
                      editableFields.add('Industry');
                      editableFields.add('site');
                      editableFields.add('AccountNumber');
                      }
                      return editableFields;
                 }
                  private set;
         }
     }