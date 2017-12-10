global class BatchYearAmountUpdate implements Database.Batchable<sObject>,Database.Stateful  {
    
    // Failed record Ids
    global List<String> exception_recordList;
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        //  List<StaticResource> docs; 
        //String query = 'SELECT Id,name ,CloseDate,Active__c FROM Opportunity WHERE ((CloseDate not in (LAST_N_DAYS:365) and Active__c =true) or ( CloseDate in (LAST_N_DAYS:365) and Active__c =falseSELECT Id,name ,CloseDate,Active__c FROM Opportunity WHERE ((CloseDate not in (LAST_N_DAYS:365) and Active__c =true) or ( CloseDate in (LAST_N_DAYS:365) and Active__c =false))';
        String query = 'SELECT Id,name,CloseDate,Active__c FROM Opportunity';
        //StaticResource sr = [select body from StaticResource where name = 'Flag_Update_Query'];   
        //Blob bodyBlob = sr.Body;
        //String query = bodyBlob.toString();    
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        try{
            List<Opportunity> opps = new List<Opportunity>();
            for(sObject obj : scope){
                Opportunity opp = (Opportunity)obj;
                if(opp.Active__c ==false)
                {
                    opp.Active__c = true;
                    //System.debug('Opprotunities has been updated true.');
                    
                } 
                else {                
                    opp.Active__c = false;
                    //System.debug('Opprotunities has been updated false.');
                }
                opps.add(opp);
            }
            
            Database.SaveResult[] SaveResultList = Database.update(opps,false); 
            // Check for the records which are failed 
            exception_recordList = new List<String>();
            for(Database.SaveResult sr : SaveResultList){
                // If records are failed 
                if(!sr.isSuccess()){
                    exception_recordList.add(sr.getId());
                }
            }
        }
        Catch (DMLException e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
    }
    global void finish(Database.BatchableContext BC) {
        if(exception_recordList != NULL){
            
            BatchRun__c customSet = [SELECT Id,Name,No_Of_Run__c FROM BatchRun__c LIMIT 1];
            if(customSet.No_Of_Run__c < 2){
            	Database.executeBatch(New BatchYearAmountUpdate());
                system.debug('Running batch' + (customSet.No_Of_Run__c+1) + ' Time');
                customSet.No_Of_Run__c = customSet.No_Of_Run__c+1;
            }else{
                
                customSet.No_Of_Run__c = 0; 
                // NOTIFY PEOPLE IN CASE OF MORE ERROR
                AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                                  FROM AsyncApexJob 
                                  WHERE Id =: BC.getJobId()];
               // Send an email to the Apex job's submitter notifying of job completion.
               Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               String[] toAddresses = new String[] {a.CreatedBy.Email};
               mail.setToAddresses(toAddresses);
               mail.setSubject('Apex Batch Execution Failed Records ');
               String body = 'List of failed Opportunity Ids /n';
                for(String s : exception_recordList){
                  body = body + s + '/n';  
                } 
               mail.setPlainTextBody(body);
               Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            } 
            
            update customSet;
        } 
    }
}