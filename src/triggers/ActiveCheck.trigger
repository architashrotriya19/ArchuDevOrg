trigger ActiveCheck on Contact (after insert, after update)  {
    
    Set<Id> accountIds = new Set<Id>();
    
    for(Contact con : Trigger.new){
        if(con.active__c == 'No'){
            accountIds.add(con.AccountId);
          
        }
    }
    
    //List<Account> accounts = new list<Account>();
    //accounts = [SELECT Id,Name,Active__C,(SELECT id,active__c FROM contacts) FROM account WHERE id IN :accountIds];
    
    List<Account> accToUpdate = new List<Account>();
    
    for(Account acc : [SELECT Id,Name,Active__C,(SELECT id,active__c FROM contacts) FROM account WHERE id IN :accountIds])
    {
        Boolean flag = true;
        for(contact co : acc.contacts){
            if(co.active__c =='Yes' )
            {
              flag = false;  
            }     
        }
        
        
        if(flag){
        	accToUpdate.add(acc);
        }    
        
    }
    
    Update accToUpdate; 
    
}