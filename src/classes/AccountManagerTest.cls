@isTest
public class AccountManagerTest {
    static testMethod void checkTestExecution(){
        Account account = new Account(Name = 'Test Account');
        insert account;
        Contact contact = new Contact(LastName = 'Last F',FirstName = 'g',AccountId=account.Id);
        insert contact;
        RestRequest request = new RestRequest();
        request.requestUri = 'http://intresting-developer-edition.ap2.force.com/services/apexrest/Accounts/'+ account.Id+'/Contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
    }
    
    static testMethod void checkTestExecution2(){
        Account account = new Account(Name = 'Test Account');
        insert account;
        Contact contact = new Contact(LastName = 'Last F',FirstName = 'g',AccountId=account.Id);
        insert contact;
        RestRequest request = new RestRequest();
        request.requestUri = 'http://intresting-developer-edition.ap2.force.com/services/apexrest/Accounts/';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount == null);
    }
}