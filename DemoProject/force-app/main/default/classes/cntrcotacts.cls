public with sharing class cntrcotacts{
     
     private integer count=0;
     private integer size=5;
     integer totalsize;
     integer diff;
    public cntrcotacts(ApexPages.StandardSetController controller) {

    }
    public cntrcotacts()
    {
    totalsize=[select count() from account];
    }


 Public list<account> getAccount()
 {
 try{
  return[select name,id,(select id,name from contacts)from account limit:size offset:count];
 }
 catch(QueryException e)
 {
  ApexPages.addMessages(e);
  return null;
 }
 }
 
 public pagereference first()
 {
  count=0;
  return null;
 }
 public pagereference Previous()
 {
  count=count-size;
  return null;
 }
 public pagereference next()
 {
  count+=size;
  return null;
 }
 public pagereference last()
 {
  count=totalsize-math.mod(totalsize,size);
  return null;
 }
 public boolean getdisablepre(){
 if(count>0) return false;
 else
 return true;
 }
  public boolean getdisablenextt11(){
  if(count + size < totalsize) return false;
 else 
 return true;
 }
}