public class clsMultipleRowWrapper{
            @auraEnabled public string name;
           @auraEnabled public string type;
           @auraEnabled public boolean isDisableAddBtn;
            
            public clsMultipleRowWrapper(string name,string type, boolean disablebtn){
                this.name = name;
                this.type = type;
                this.isDisableAddBtn = disablebtn;
            }
        }