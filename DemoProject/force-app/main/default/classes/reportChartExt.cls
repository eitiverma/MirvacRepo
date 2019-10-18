public class reportChartExt{
    public string rate{get;set;}
    
   public reportChartExt(ApexPages.StandardController cntr){
    
    }
    public list<SelectOption> getItems(){
        list<selectOption> options = new list<SelectOption>();
        options.add(new SelectOption('HOT','Hot'));
        options.add(new SelectOption('COLD','Cold'));
        options.add(new SelectOption('WARM','Warm'));
        return options;
    }
}