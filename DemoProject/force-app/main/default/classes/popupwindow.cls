public class popupwindow 
{
Public string textval{get;set;}

Public List<Account> getAccounts()
{
List<Account> acclist = [select name from account limit 10];
return acclist;
}

Public void filltextval()
{
textval = apexpages.currentpage().getparameters().get('name1');
}

}