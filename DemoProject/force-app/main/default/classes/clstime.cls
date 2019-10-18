public class clstime {
  private string t;
    public string getCtime()
    {
        return t;
    }
    public pagereference ptime()
    {
        t=String.valueOf(datetime.now());
        return null;
    }
}