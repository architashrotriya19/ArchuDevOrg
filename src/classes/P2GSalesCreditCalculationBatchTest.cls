@isTest
private class P2GSalesCreditCalculationBatchTest {
// UN COMMENT THE CODE BELOW FOR THE TEST CLASS

/*  REMOVE THIS TAG


 
    
    public static void init(){
      // static{
       List<Opportunity> opportunities = new List<Opportunity>();
       opportunities = TestDataFactory.createOpportunityRecords(5,'Q2C','Individual','Closed Won');
      
        List<PriceBookEntry> pbEntry = TestDataFactory.createPriceBookEntryRecords(1);
      
   //    List<Product2> listOfProduct2 = TestDataFactory.createProduct2Records(1);
       
         List<OpportunityLineItem> oppLineItems = new List<OpportunityLineItem>();
        
         // TO STATISFY the QUERY need to add values to field
    	for(Opportunity opp : opportunities){
    		opp.Migrated_for_Zuora__c = FALSE;
    		opp.Valuation_12_month__c = NULL;
    		opp.Delivery_Start_Date__c = Date.today();
           
            // Opportunity Line Item Addition
			OpportunityLineItem opLi = new OpportunityLineItem();
			opLi.OpportunityId = opp.Id;
			opLi.Quantity = 5;
			opLi.UnitPrice = 12000.00;
			opLi.Q2C_Non_Renewable__c = FALSE;
			opLi.Sales_Credit_Amount__c = 100.0;
			opLi.PriceBookEntryId = pbEntry[0].Id;
            // opLi.Product2Id =listOfProduct2[0].Id;
			oppLineItems.add(opLi);	
    		oppLineItems.add( new OpportunityLineItem(OpportunityId = opp.Id, Quantity = 5 , UnitPrice = 12000.00,Q2C_Non_Renewable__c = FALSE,Sales_Credit_Amount__c = 100,PriceBookEntryId=pbEntry[0].Id) );
        }
      update opportunities;
      insert oppLineItems;      
           
       }
    
    static testmethod void testOpportunityBatch() {
        
        init();
    	Test.startTest();
    	P2GSalesCreditCalculationBatch pgOppBatch = new P2GSalesCreditCalculationBatch();
    	Database.executeBatch(pgOppBatch);
        List<Opportunity> opps = [SELECT Id,Valuation_12_month__c FROM Opportunity WHERE Valuation_12_month__c != NULL];
   // 	system.assertNotEquals(opps.size(),0,'Batch class is updating the opportunities properly');
    	Test.stopTest();
    }
    ///// code to check ////showing error
     static testmethod void testOpportunityBatch2() {       
        init();
		Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u2 = new User(Alias = 'newUse12r', Email='dummy@ttuser.com', 
         EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
         LocaleSidKey='en_US', ProfileId = p.Id, 
         TimeZoneSidKey='America/Los_Angeles', UserName='dummy@ttuser.com.qa');
        
		Test.startTest();
		
		System.runAs(u2) {
        	P2GSalesCreditCalculationBatch pgOppBatch = new P2GSalesCreditCalculationBatch();
    		Database.executeBatch(pgOppBatch);
        	List<Opportunity> opps = [SELECT Id,Valuation_12_month__c FROM Opportunity WHERE Valuation_12_month__c != NULL];
		}
        Test.stopTest();
    }


    

REMOVE THIS TAG */    

}