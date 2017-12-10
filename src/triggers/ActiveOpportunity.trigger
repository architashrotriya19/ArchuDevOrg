trigger ActiveOpportunity on Opportunity (after insert,after update,after delete) {
	Set<Id> accIds = new Set<Id>();
    if(!Trigger.isDelete){
    for(Opportunity opp : Trigger.new){
        // On insert if the opportunity checkbox is check then take the acc
        // for update
        if(Trigger.isAfter && Trigger.isInsert && opp.Active__c){
        	accIds.add(opp.AccountId);    
        // Take the account for update only when the checkbox value is changed
        }if(Trigger.isAfter && Trigger.isUpdate && Trigger.oldMap.get(opp.Id).Active__c != opp.Active__c){            
            accIds.add(opp.AccountId);                   
        } 
    }
    }else{    
    
    for(Opportunity opp : Trigger.old){        
        if(Trigger.isAfter && Trigger.isDelete){            
            accIds.add(opp.AccountId);                   
        }	            
    }
    }    
    
    List<Account> accounts = new List<Account>();
	accounts = [SELECT Id,Name,Active_Opprtunities__c FROM Account WHERE Id IN :accIds];
    
    // Query all opportunities of these accounts
    
    // Map to put per account ID what is the count
    Map<Id,Integer> counts = new Map<Id,Integer>();
    
    
    for(Opportunity op : [SELECT Id,Active__c,AccountId FROM Opportunity WHERE Active__c = TRUE AND AccountId IN :accIds Order By AccountId]){
        if(counts.containsKey(op.AccountId)){
            Integer i = counts.get(op.AccountId) + 1;
            counts.put(op.AccountId,i);
        }else{
	        counts.put(op.AccountId,1);
        }    
    }
    
    for(Account a : accounts){
        a.Active_Opprtunities__c = (counts.containsKey(a.Id) ? counts.get(a.Id) : 0.0 );
    }
    
    update accounts;

}