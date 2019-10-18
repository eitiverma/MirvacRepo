public class acccontroller
{
public list<accwrapper> lstwrapper{get;set;}

public list<contact> cc {get;set;}
list<contact> lstcon1 = new list<contact>();
public contact ctname{get;set;} 
public contact c;
public boolean isEditMode{get;set;}


public acccontroller() 
{
ctname=new contact();
lstwrapper=new list<accwrapper>();

cc=new List<Contact>();
}

 public pageReference search()
 {
 lstcon1=[select birthdate,email,name,id from contact where accountid=:ctname.accountid];

    for(Contact c:lstcon1)
    {
        lstwrapper.add(new accwrapper(c));
        system.debug(lstwrapper[0]);
    }

 
 return null;
 }
 
 
public pagereference update1()
{
 pagereference pf = new pagereference('/apex/selectedcontacts');
 pf.setredirect(false);


return pf;
}  
 
public pagereference getselected()
 {
 
 for(accwrapper w:lstwrapper)
 {
  if(w.selected==true)
  {
   cc.add(w.ct);
   system.debug('eeeeeeeeee'+cc[0]);
  }
  }
  return null;
}



public list<contact> getcw()
{
if(cc.size()>0)
{
system.debug('HELLLOOOOOOO');
return cc;}
else 
system.debug('PPPPPPPPPPPP');
return null;
}

public pagereference redirect()
{
 isEditMode = false;
 if(ApexPages.CurrentPage().getParameters().get('EditMode')=='1'){
 isEditMode= true;
 }
 return null;
 }
 
  public pagereference saved()
 {
   return null;
  }
public class accwrapper{
public contact ct{get;set;}
public boolean selected{get;set;}
public accwrapper(contact a)
{
ct=a;
selected = false;
}
}
}