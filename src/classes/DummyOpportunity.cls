public class DummyOpportunity {
	
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
        try{
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Integer loop_var = 0;loop_var < countOpp;loop_var++){
        	Opportunity opp = new Opportunity();
        	opp.Name = oppName+'_'+String.valueOf(loop_var);
        	opp.StageName = stageName;
        	opp.CloseDate = closedDate;
        	opp.AccountId = accountId;
            opportunities.add(opp);
        }
        insert opportunities;
    }
     Catch (DMLException e){
         System.debug('The following exception has occurred: ' + e.getMessage());
     }
        System.debug('Opprotunities has been created successfully.');
}
}