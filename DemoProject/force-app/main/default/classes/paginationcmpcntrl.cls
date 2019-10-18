public class paginationcmpcntrl extends CompControllerBase {
public ApexPages.StandardSetController ssc {get;set;}    
    public list<account> listofevents{get;set;}
    public account event{get;set;}
    public Boolean ShowPanel {get;set;}
    public example a{get;set;}
public string Datename { get; set; }
//public pgcntr pageController{get;set;}
public account acc{get;set;}

public paginationcmpcntrl(){
acc=new account();
//acc=[select id,name,SLAExpirationDate__c,Type from account limit 1];
    listofevents = new List<account>();
       //event=new account();
      
       //event= (Account)Controller.getRecord();
       ShowPanel = false;}
    public paginationcmpcntrl(ApexPages.StandardController controller) 
    {
    
}
public pagereference retrieveevents()
    {
     event=(((pgCntr)pageController)!=null?((pgCntr)pageController).objevent:null);
       system.debug('ValuePAGE'+pageController);
       system.debug('Hello'+event);
        system.debug('%%');

        listofevents=conflictevents(event);

        ssc=new ApexPages.StandardSetController(listofevents);
        ssc.setPageSize(2);
        first();

        system.debug('%%'+listofevents);
        ShowPanel = true;
        return null;
    }
    
    public list<account> conflictevents(account event)
    {
    integer b = a.method12();
    String strQuery ='';

    if(event.SLAExpirationDate__c!=null)
    {
        strQuery = strQuery + '  where SLAExpirationDate__c = '+string.valueof(event.SLAExpirationDate__c);
    }
        
    if(event.Type !=null)
    {
        if(strQuery !='')
        {
            strQuery = strQuery + ' and Type= \'' + event.Type + '\'';
        }
        else
        {
            strQuery ='where Type =\'' + event.Type + '\'';
        }
    }    

        if(strQuery  != '')
        {
            strQuery = 'select id,name,Type,SLAExpirationDate__c from account ' + strQuery  +' limit 100 ' ;
        }
        else
        {
            strQuery ='select id,name,SLAExpirationDate__c from account limit 100 ';
        }     
 
    system.debug('$$'+strQuery );
        
        list<Account> acc = Database.query(strQuery );

      
      return acc;
    }
   public void first() {
        ssc.first();
        listofevents= ssc.getRecords();
    }
    public void last() {
        ssc.last();
        listofevents= ssc.getRecords();
    }
    public void previous() {
        ssc.previous();
        listofevents= ssc.getRecords();
    }
    public void next() {
        ssc.next();
        listofevents= ssc.getRecords();
    }
    public Boolean hasNext {
        get{
            if(listofevents!=null && listofevents.size()>0){
                return ssc.getHasNext();
            }
            else{
                return false;
            }
        }
        set;
    }
    
    public Boolean hasPrevious {
        get{
            if(listofevents!=null && listofevents.size()>0 ){
                return ssc.getHasPrevious();
            }
            else{
                return false;
            }
        }
        set;
    }

   
    public Integer getPageNumber_do()
    {
        if(listofevents.size() >0 )
        {
        return ssc.getPageNumber();
        }
        else
        {
            return null;
       } 
            //return 1;
    }
    
    
     public Integer getPageSize_do()
    {
         Integer totalPages = 1 ;
         Integer divident= 2;
          if(listofevents.size() >0 )
        {

          if(ssc.getResultSize() !=0)
          {
              totalPages =  ssc.getResultSize()/Integer.valueOf(divident) ;
              if( math.mod(ssc.getResultSize(),Integer.valueOf(divident) )!= 0)
             {
                totalPages =ssc.getResultSize()/Integer.valueOf(divident) + 1;
              }
          }
        return totalPages;
         
         } 
        else
        {
        return 1;
        }
        
                 

        //return 1;
    }



   
}