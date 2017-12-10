global class BatchClassEx implements Database.Batchable<sObject> {
	global Database.QueryLocator start(Database.BatchableContext BC){
      return null;
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
     
    }

   global void finish(Database.BatchableContext BC){
   }
}