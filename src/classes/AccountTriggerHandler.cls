public with sharing class AccountTriggerHandler {
	
	/*
	 * Auther :- Vivek Deepak	
	 * Purpose :- DEcription of class Demo by Vivek
	 *
	 *
	 *
	 */
	 
	 //-- SINGLETON PATTERN
      private static AccountTriggerHandler instance;
      public static AccountTriggerHandler getInstance() {
          if (instance == null) instance = new AccountTriggerHandler();
          return instance;
      }
      
     // -- ATTRIBUTES    
	 
	 
	 public String accountName {get;set;}
	 
	
	 //-- CONSTRUCTOR 
	 
	
	 private AccountTriggerHandler(){
	 
	 
	 }
	 
	
	 //-- METHODS 
	 
	
	//-- Before Insert
	
	  
	 public void onBeforeInsert(final List<Account> newObjects){
	 
	 	
	 }
	 
	
	 //-- Before Update
	 
	  
	 public void onBeforeUpdate(final List<Account> newObjects,final List<Account> oldObjects,final Map<Id, Account> newObjectsMap,final Map<Id, Account> oldObjectsMap){
	 
	 	
	 }
	 
	
	 //-- Before Delete
	 
	  
	 public void onBeforeDelete(final List<Account> oldObjects,final Map<Id, Account> oldObjectsMap){
	 
	 	
	 }
	 
	 //-- After Insert
	 
	  
	 public void onAfterInsert(final List<Account> newObjects,final Map<Id, Account> newObjectsMap){
	 
	 	
	 }	
	 
	
	//-- After Update
	
	  
	 public void onAfterUpdate(final List<Account> newObjects,final List<Account> oldObjects,final Map<Id, Account> newObjectsMap,final Map<Id, Account> oldObjectsMap){
	 
	 	
	 }
	 
	 
	 //-- After Delete
	 	  
	 public void onAfterDelete(List<Account> oldObjects,final Map<Id, Account> oldObjectsMap){
	 
	 	
	 }	 	  
}