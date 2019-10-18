public class loadimgOnRedirectCntr{

    public loadimgOnRedirectCntr(){
    }
    
    public pageReference newPage()
    {
        pageReference pgref = new pagereference('/apex/TimeLogPage');
        pgref.setRedirect(true);
        return pgref;
    }
}