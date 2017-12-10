({
	getAllAccounts : function(comp) {
		var action = comp.get("c.getAllMyAccount");
        action.setCallback(this, function(resp){
            comp.set("v.accList",resp.getReturnValue());
        });
        
        $A.enqueueAction(action);
	}
})