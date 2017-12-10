public class OpportunityRollup {

    public void triggerMethod(){
        // After Insert, update
        /*
        Map<Id,Decimal> accountMap = new Map<Id,Decimal>();
        for(Snapshots__c sn : Trigger.new){
            accountMap.put(sn.Account_Name__c ,sn.Amount__c);
        }
        
        List<Account> accounts = new List<Account>();
        accounts = [SELECT Id,Amount FROM Account WHERE Id IN :accountMap.keySet()];
        for(Account acc : accounts){
            acc.Amount = accountMap.get(acc.Id);
        }
        update accounts;
        */
    }
}