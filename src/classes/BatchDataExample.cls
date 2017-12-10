global class BatchDataExample implements Database.Batchable<sObject> {
      String email='jrajasekaran@salesforce.com'; 
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name,Amount1__c,Amount2__c,Amount3__c,Account.Amount1__c,Account.Amount2__c,Account.Amount3__c  FROM Opportunity';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        try{
         List<Opportunity> opps = new List<Opportunity>();
             for(sObject obj : scope){
                 // Type cast generic sobject to specific sobject which is opportunity here
                 Opportunity opp = (Opportunity)obj;
				 opp.Amount1__c = opp.Account.Amount1__c;
                 opp.Amount2__c = opp.Account.Amount2__c;
                 opp.Amount3__c = opp.Account.Amount3__c;
                 opps.add(opp);
             }
       update opps;
    }   
   Catch (DMLException e){
         System.debug('The following exception has occurred: ' + e.getMessage());
     }
        System.debug('Opprotunities has been created successfully.');
    }
    global void finish(Database.BatchableContext BC) {
        // If there is any error is in a single batch you can send email or record it into any object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        mail.setToAddresses(new String[] {email}); 
        mail.setReplyTo('test@gmail.com'); 
        mail.setSubject('Batch Process Completed'); 
        mail.setPlainTextBody('Batch Process has completed/Failed'); 
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
    }
}