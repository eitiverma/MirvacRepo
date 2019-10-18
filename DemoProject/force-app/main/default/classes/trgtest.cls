@isTest
public class trgtest{
 public static testMethod void inserttrans()
 {
   BankMaster__c b = new BankMaster__c();
    b.name='prishu';
    b.nameccc__c= ' pihu';
    insert b ;
    
    Bank_Transcation__c bt = [select id , namecc__c from Bank_Transcation__c where AccountNo__c=:b.id];
     system.assertEquals('pihu',bt.namecc__c);
   
    b.nameccc__c='pc';
    update b ;
     Bank_Transcation__c bt1 = [select id , namecc__c from Bank_Transcation__c where AccountNo__c=:b.id];
     system.assertEquals('pc',bt1.namecc__c);
    
 }
}