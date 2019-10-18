public class tocheckRenderingInOutputPanel{

    public string pickVal{get;set;}
    public boolean boolshowPanel{get;set;}
    
    public tocheckRenderingInOutputPanel(){
        //boolshowPanel = false;
    
    }
    
    public List<SelectOption> getValues()
    {
          List<SelectOption> options = new List<SelectOption>();
          options.add(new SelectOption('A','A'));
          options.add(new SelectOption('B','B'));
          options.add(new SelectOption('C','C'));
          return options;
    }
    
    public void showPanel()
    {
        system.debug('pickVal ====== '+pickVal);
        //if(pickVal == 'B')
          boolshowPanel = true;
       //else
          // boolshowPanel = false;
           
       system.debug('boolshowPanel ====== '+boolshowPanel);    
       //return null;  
    }
}