trigger AccountTrigger on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {
	
	//-- Instantiate the handler
	AccountTriggerHandler handler = AccountTriggerHandler.getInstance();
    
	//-- Before Insert
	if (Trigger.isInsert && Trigger.isBefore) {
		handler.onBeforeInsert(Trigger.new);
	} else

	//-- Before Update
	if (Trigger.isUpdate && Trigger.isBefore) {
		handler.onBeforeUpdate(Trigger.new, Trigger.old,Trigger.newMap,Trigger.oldMap);
	} else
	
	//-- Before Delete
	if (Trigger.isDelete && Trigger.isBefore) {
		handler.onBeforeDelete(Trigger.old, Trigger.oldMap);
	} else
	
	//-- After Update
	if (Trigger.isUpdate && Trigger.isAfter) {        
		handler.onAfterUpdate(Trigger.new, Trigger.old,Trigger.newMap,Trigger.oldMap);
	} else   
	  
    // -- After Insert      
	if (Trigger.isInsert && Trigger.isAfter) {        
		handler.onAfterInsert(Trigger.new,Trigger.newMap);
	} else
	
	// -- After Delete
	if(Trigger.isDelete && Trigger.isAfter){
		handler.onAfterDelete(Trigger.old, Trigger.oldMap);
	}

}