public class CallCustomSetting {
	
    List<Custom_Demo__c> demoVal {get;set;}
    
    public CallCustomSetting(){
        demoVal = new List<Custom_Demo__c>();
        // This will give all values 
        demoVal = Custom_Demo__c.getall().values();
        
        // This will values per or specific record from name field
        Boolean flag = Custom_Demo__c.getValues('Hello').True_False__c;
    }
}