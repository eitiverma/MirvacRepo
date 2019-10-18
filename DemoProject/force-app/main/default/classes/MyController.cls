public class MyController
{
    Account acc;
    public string getname(){
        return 'Eiti Verma';
     }
     
     public account getAccount(){
         acc = [Select id, name from Account where id=:ApexPages.CurrentPage().getParameters().get('Id')];
         return acc;
        }
        
    public pageReference save(){
     
         update acc;
         pageReference s= Page.Mypage11;
         s.setRedirect(true);
         s.getParameters().put('id',acc.id);
         return s;
             }      
 }