public class ApprovalProcessByApex{
   
   public Opportunity opp{get;set;}
   public boolean IsLocked{get;set;}
   public ApprovalProcessByApex(){
       IsLocked = false;
        Id id = ApexPages.currentPage().getParameters().get('id');
       if(id==null)
       {
           opp = new opportunity();
       }
       else
       {
           opp = [select stageName,name,Id,approvername__c,CloseDate from opportunity where Id=:id];
       }
   }
  
   public pageReference saveRecord(){
    system.debug('++++Value'+Islocked);
       upsert opp;
        PageReference pg = new PageReference('/apex/confirmpage?id='+opp.id);
       return pg;
   } 
   
   public pageReference DetailRecord(){
       PageReference pg = new PageReference('/apex/confirmpage?id='+opp.id);
      submitForApproval(opp); 
      return pg; 
   }
   
    public pageReference EditRecord(){
       PageReference pg = new PageReference('/apex/approvalpage?id='+opp.id);
      //submitForApproval(opp); 
      return pg; 
   }
   
    
    // This method will submit the opportunity automatically

    public void submitForApproval(Opportunity opp)

    {
        Islocked = true;
        // Create an approval request for the Opportunity
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();

        req1.setComments('Submitting request for approval automatically using Trigger');
        req1.setObjectId(opp.id);
        req1.setNextApproverIds(new Id[] {opp.approvername__c});
        // Submit the approval request for the Opportunity
        Approval.ProcessResult result = Approval.process(req1);
        system.debug('+++Value of ISLOCKED +++++'+IsLocked);
    }
    
    public pageReference approveRecordDetail(){
     system.debug('++++ Value1 +++'+Islocked);
        PageReference pgapprove = new PageReference('/'+opp.id);
        pgapprove.setRedirect(true);
        approveRecord(opp);    
        return pgapprove;
    }
    
    public void approveRecord(Opportunity opp)
    {
         system.debug('++++ Value2 +++'+Islocked);
        islocked = false;
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments('Approving request using method');
        req.setAction('Approve');
        req.setNextApproverIds(new Id[] {opp.approvername__c});
        Id workItemId = getWorkItemId(opp.id);
        //opp.addError(workItemId);
        if(workItemId == null)
        {
            opp.addError('Error Occured in process');
            //opp.addError(workItemId);
        }
        else
        {
            req.setWorkitemId(workItemId);
            // Submit the request for approval
            Approval.ProcessResult result =  Approval.process(req);
        }
         system.debug('+++Value of ISLOCKED +++++'+IsLocked);
    }

     public pageReference RejectRecordDetail(){
         PageReference pgapprove = new PageReference(opp.id);
        rejectRecord(opp);    
        return pgapprove;
    }
    
    public void rejectRecord(Opportunity opp)
    {
        isLocked = false;
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments('Rejected request using method');
        req.setAction('Reject');
        //req.setNextApproverIds(new Id[] {UserInfo.getUserId()});
        Id workItemId = getWorkItemId(opp.id);
        //opp.addError(workItemId);
 
        if(workItemId == null)
        {
            opp.addError('Error Occured in process');
            //opp.addError(workItemId);
        }
        else
        {
            req.setWorkitemId(workItemId);
            // Submit the request for approval
            Approval.ProcessResult result =  Approval.process(req);
        }
    }

    public Id getWorkItemId(Id targetObjectId)
    {
        Id retVal = null;
        for(ProcessInstanceWorkitem workItem  : [Select p.Id from ProcessInstanceWorkitem p
            where p.ProcessInstance.TargetObjectId =: targetObjectId])
        {
            retVal  =  workItem.Id;
        }
        return retVal;
    }

}