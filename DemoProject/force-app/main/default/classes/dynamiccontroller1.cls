public class dynamiccontroller1{

        public final opportunity opp{get; private set;}
        
        public dynamiccontroller1(ApexPages.standardController cntr){
             string sid= ApexPages.CurrentPage().getParameters().get('id');
             string qry = 'select id,'+joinlist(oppFields,',')+' from opportunity where id=:sid';
              this.opp = Database.Query(qry);           
         }  
         
         

          
           public list<string> oppFields{
            get {
                 if(oppFields==null){
                  oppFields = new list<string>();
                  oppFields.add('amount');
                  oppFields.add('leadsource');
                  oppFields.add('Account.name');
                  oppFields.add('Account.industry'); 
                 }
                 return oppFields;
                }
               private set;
              }
               
              public string joinlist(list<string> lst, string separator)  
               {
                   if(lst==null){
                    return null;
                    }
                   if(separator==null){
                   
                    separator = '';  
                    }
                    
                    string joined = '';
                    boolean firstitem = true;
                    for(string item:lst){
                     if(null!=item){
                        if(firstitem){
                        firstitem = false;
                        }
                      else{
                        joined += separator;
                        }
                        joined += item;                    
                      } 
                      }
                       return joined;                   
                                      
                                                      
               }      
}