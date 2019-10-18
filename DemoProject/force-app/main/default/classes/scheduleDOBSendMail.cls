global class scheduleDOBSendMail implements Schedulable{
    
    global void execute(SchedulableContext SC){
         DOBSendMail dsm = new DOBSendMail();
         database.executebatch(dsm);
         
    }
}