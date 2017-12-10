public class AddMultipleContactExt  {
  
    Public List<Contact> conList {get; set;}
    //public List<Contact> ContactsToInsert { get; set; }
   // public Contact con = new Contact();
    public Contact con {get; set;}
    
    public AddMultipleContactExt(ApexPages.StandardSetController controller)
    {  
       conList = new List<Contact>();
           Contact con = new Contact();
         //  conList.add(con);
    }
    
    
    public PageReference isSave()
    {
       try
        {
           insert conList;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Saved Successfully.Thank you!'));
         }
       catch(DMLException e)
          {
             ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Record Saving failed: ' + e.getMessage()));
          }
        return Null; 
  }
    
    public void isCancel()
    {        
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record not Saved '));
  }
    
    public void isaddRow()
    {    
        //  Contact con = new Contact();
          conList.add(con); 
          Contact con = new Contact();
         conList.add(con); 
        
    } 
    
    public void isDelete()
    {
        system.debug('in delete');
        for(Contact con : conList){ 
             if(con.LastName == null || con.LastName == ''){
                 system.debug('in for in if');
           conList.add(con);
          }
      }
     if(conList.size() > 0){
         system.debug('$$$$$ DeleteContactsList' + ConList);
         delete conList;
 }
    }                                           
}