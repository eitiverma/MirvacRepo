global class DOBSendMail implements Database.Batchable<SObject>
    {
        
        
        global Database.QueryLocator start(Database.BatchableContext BC){
        
            
            return Database.getQueryLocator([Select FirstName,LastName,Date_of_Birth__c,Email from contact]);
        }
        
        global void execute(Database.BatchableContext BC, List<SObject> scope)
        {
        
            EmailTemplate temp = [select Id from EmailTemplate where name = 'birthday mail'];
            for(SObject s : scope){
                Contact con = (Contact)s;
                if(con.Date_of_Birth__c==System.today())
                {
                   /* Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                    String[] toAddresses = new String[] {con.Email};

                    mail.setToAddresses(toAddresses);

                    mail.setSubject('Birthday Wishes');

                    mail.setPlainTextBody('HAPPY BIRTHDAY'+' '+con.FirstName+' '+con.LastName);

                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); */
                    
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                    //String[] toAddresses = new String[] {con.Email};

                    //mail.setToAddresses(toAddresses);
                    
                    mail.setTargetObjectId(con.id);
                    mail.setTemplateId(temp.id);
                    mail.setSaveAsActivity(false);

                    //mail.setSubject('Birthday Wishes');

                    //mail.setPlainTextBody('HAPPY BIRTHDAY'+' '+con.FirstName+' '+con.LastName);

                    Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                    

                }
                }
        }
        global void finish(Database.BatchableContext BC){
        }
    }