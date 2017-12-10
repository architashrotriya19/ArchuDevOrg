public class OpportunityDetailDisplayExtension {
   
    // This is the number we will input for search
    public String accoutNumber {get;set;}
    public Boolean showAccountTable {get;set;}
     public string header{get;set;}
  //  public List<wrapper> lstwrapper {get; set;}
    
    // This is the list which it will return
    public List<Opportunity> opportunityDetails {get;set;}
    
    public List<Account> accountDetails {get;set;} 
    
    public List<Contact> contactDetails {get;set;} 
      
    public OpportunityDetailDisplayExtension(){
        opportunityDetails = new List<Opportunity>();
        showAccountTable = FALSE;
    }
    
    // This is the method which the page call
    public PageReference searchOpportunityDetail(){
    system.assertNotEquals(accoutNumber,null);
        
        opportunityDetails = new List<Opportunity>();
        opportunityDetails = [SELECT id,Name,Account.name,StageName,probability,account.accountnumber 
                              FROM Opportunity 
                              WHERE Account.Accountnumber =:accoutNumber];
      
        //Error Handling for invalid BIC
       if (opportunityDetails.isEmpty())
        {
            showAccountTable = false;
     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter valid BIC value'));
    return null;
        } 
 
       
        //system.assertNotEquals(opportunityDetails,null);
        accountDetails = new List<Account>();
        accountDetails = [SELECT id,Name,Type,Industry
                              FROM Account 
                              WHERE Accountnumber =:accoutNumber];                       
                              
        showAccountTable = TRUE;    
        contactDetails =new List<Contact>();
        contactDetails =[SELECT name,email,homephone,department from contact where 
                         account.accountnumber=:accoutNumber];  
        
        
     return Null;
    }
    
   //  public PageReference exportExcel(){
     //       Filetype = '';
      //      lstwrapper = new List<wrapper>();
        //    header = 'Ship To,Search Number,Account Name,Business Unit,Date,Expiration Date,Expiration End Date,Expiration Start Date,Group,Implant Date ,Invoice Date,Invoice Number\r\n';                     
  //  }
    
}