public class TrainingController {
	// Class Name always CamelCase
	// method name getAccountDetails
	// variable accountCount
	
    public Integer i;
    public Account acc;
    public Account accountProperty {get;set;}
    public Id AccountId {get;set;}
    
    public TrainingController(){
        accountProperty = new Account();
    }
      
    public List<Account> getAllAccounts(){
        //List<Account> accountList = new List<Account>();
       // accountList = [SELECT Id,Name,type, Industry , AnnualRevenue  FROM Account LIMIT 10];
        return [SELECT Id,Name,type, Industry , AnnualRevenue  FROM Account];
    }
    
    public PageReference saveAccount(){
        insert accountProperty;
        return null;
    }
    
     public PageReference deleteAccount(){
       //insert accountProperty;
       Account acc =  [SELECT Id FROM Account WHERE Id =:AccountId];
         delete acc;
        return null;
    }
    
    // Access specifier, returntype, method name (paramerter)
}