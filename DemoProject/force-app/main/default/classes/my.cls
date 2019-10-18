public class my {
public list<Account> adda(string[] n,string[] p)
{  list <Account> l1 = new list<Account>();
    for(integer i=0;i<n.size();i++)
    {
    account a=new Account(name=n[i],phone=p[i]);
       
        l1.add(a);
        insert l1;
   
    
}
  return l1;
    
}
}