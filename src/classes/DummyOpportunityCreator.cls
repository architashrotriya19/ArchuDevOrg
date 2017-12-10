public class DummyOpportunityCreator {
	
    // Single Opportunity with Account
    public static void createSingleOpp(String oppName,String stageName,Date closedDate,String accountId){
        Opportunity opp = new Opportunity();
        opp.Name = oppName;
        opp.StageName = stageName;
        opp.CloseDate = closedDate;
        opp.AccountId = accountId;
        
        insert opp;
    }
    
    // Multiple Opportunity with Account
    public static void multiSingleOpp(String oppName,String stageName,Date closedDate,String accountId,Integer countOpp)
    {
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Integer loop_var = 0;loop_var < countOpp;loop_var++){
        	Opportunity opp = new Opportunity();
        	opp.Name = oppName+'_'+String.valueOf(loop_var);
        	opp.StageName = stageName;
        	opp.CloseDate = closedDate;
        	opp.AccountId = accountId;
            opportunities.add(opp);
        }
        	//insert opportunities;
        	// DML statement
       Database.SaveResult[] srList = Database.insert(opportunities, false);
        // Iterate through each returned result
            for (Database.SaveResult sr : srList) {
                 if (sr.isSuccess()) {
           // Operation was successful, so get the ID of the record that was processed
           System.debug('Successfully inserted  opportunities : ' + sr.getId());
                 }
                else
                {
                    // Operation failed, so get all errors 
                     for(Database.Error err : sr.getErrors()) {
                System.debug('The following error has occurred.');                    
                System.debug(err.getStatusCode() + ': ' + err.getMessage());
                System.debug('Opportunity that affected this error: ' + err.getFields());
                     }
                }      
            }
     }
}