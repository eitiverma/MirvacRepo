@isTest
public class paginationcmpcntrlTest{
    static public testmethod void init(){
        Profile p = [select id from profile where name='System Administrator'];
 
    User testUser = new User(alias = 'u188', email='u1@testorg.com',
      emailencodingkey='UTF-8', lastname='Testing55', languagelocalekey='en_US',
      localesidkey='en_US', profileid = p.Id, country='United States',
      timezonesidkey='America/Los_Angeles', username='u188@testorg.com');
 
    insert testUser;
    
    Account a = new Account();
        a.Name='Test Account';
        a.SLAExpirationDate__c=Date.newinstance(2014,02,12);
        
        insert a;

    test.startTest();
    system.runAs(testuser){
        PageReference pageRef = Page.Componentpg;
        pageRef .getParameters().put('id',a.id);
        Test.setCurrentPageReference(pageRef);
        ApexPages.StandardController controller = new ApexPages.StandardController(a); 
     paginationcmpcntrl ae = new paginationcmpcntrl();
     //Example ex= new example();
     //ae.getExample().method12();
     //ae.retrieveevents();
     ae.getPageNumber_do();
     
     ae.conflictevents(a);
       
    }
    }
}