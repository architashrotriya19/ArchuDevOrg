@isTest
public class TestRestrictContactByName {
	@isTest static void testInsertInvalidName(){
        //Test Data Setup
        Contact tstContact = new Contact(LastName = 'INVALIDNAME');
         Test.startTest();
        try{
        
         upsert tstContact;
         Database.UpsertResult result = Database.upsert(tstContact, false);
         System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
      System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                           result.getErrors()[0].getMessage());
    	}
    	catch(Exception ee)
            {

            }
        Test.stopTest();
         
        
		
    }
}