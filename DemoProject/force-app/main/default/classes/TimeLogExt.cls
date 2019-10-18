public class TimeLogExt
{
    public TimeLogs__c log{get;set;}
    public list<Electronics_shop__c> lst{get;set;}
    public TimeLogExt(ApexPages.StandardController cntr)
    {
        RecordTypeValue();
    }
    
    public pagereference searchLog()
    {
        string strquery = 'Select status,ownerId,subject,name,Start_Date__c,End_Date__c,priority,ActivityDate from task where ownerId ='+'\'' + userinfo.getUserId() +'\''+ ' And Start_Date__c='+'\'system.today()\'' ;
        list<task> lsttask = database.query(strquery);
        return null;
    }
     
     public void RecordTypeValue()
     {
        lst = [select id, recordtype.name from Electronics_shop__c];
     }
}