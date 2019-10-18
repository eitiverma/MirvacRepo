public class clsExampleOfSOAP{
    public double result{get;set;}
    public clsExampleOfSOAP(){
        callWebserviceSOAP();
    }
    
    public void callWebserviceSOAP(){
        calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        Double x = 1.0;
        Double y = 2.0;
        result = calculator.doMultiply(x,y);
        System.debug(result);
    }
}