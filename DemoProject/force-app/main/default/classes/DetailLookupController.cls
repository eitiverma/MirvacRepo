public with sharing class DetailLookupController {

    public list<account>lst{get;set;}
    public boolean getshow{get;set;}

    public DetailLookupController(ApexPages.StandardController controller) {
    lst=[Select name from account];
    getshow=false;
    if(lst.size()==null)
    getshow = true;
    }

    public PageReference lookupDetail() {
        // try to find the object referenced
        try {
            Id obj = (Id) ApexPages.currentPage().getParameters().get('id');

            return new ApexPages.StandardController(
                    obj.getSObjectType().newSObject( obj)).view();
        }
        catch (Exception e) { /* ignore exceptions */ }

        return null;
    }
}