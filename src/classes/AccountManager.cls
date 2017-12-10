@RestResource(urlMapping='/Accounts/*')
global class AccountManager {
	@HttpGet
    global static Account getAccount(){
        
        RestRequest req         = RestContext.request;
        RestResponse res        = RestContext.response;
              
        String accid = req.requestURI.substring(req.requestURI.lastIndexOf('Accounts/')+1);
        String[] st = accid.split('/');
        if(st != null && st.size() > 1){
         return [SELECT id ,name ,(SELECT id ,Name FROM contacts) FROM Account WHERE Id =:st[1]];   
        }else{
            return null;
        }
        
    }
}