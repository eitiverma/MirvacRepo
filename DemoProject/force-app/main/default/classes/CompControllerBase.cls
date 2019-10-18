public with sharing virtual class CompControllerBase{
    public pgControllerBase pagecontroller{get;
    set{
    if(value!=null){
    
    pagecontroller=value;
    pageController.setsliderComponentController(this);    
    system.debug('--->inside compcontrl'+pagecontroller);}
    }
    }
    }