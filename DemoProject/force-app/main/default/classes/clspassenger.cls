public class clspassenger {
public integer age
{
    get;
    set
    {
        age=value;
        if(age<18)
            throw new clsexception();
    }
}
}