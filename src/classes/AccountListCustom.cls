public class AccountListCustom {
	
    @AuraEnabled
    public static List<Account> getAllMyAccount(){
        return [SELECT Id,Name,Type,Industry FROM Account LIMIT 20];
    }
}