public class ShowOpportunityCOntroller {
    
    public string selected{get;set;}
    public List<WrapperOpportunity> opplst {get;set;}
    public Boolean stageUpdate {get;set;}
     public Boolean showThankYou {get;set;}
    
    public ShowOpportunityCOntroller()
    {
      opplst = new List<WrapperOpportunity>();   
    }
    
    public List<SelectOption> getpicklst()
    {
        List<SelectOption> option=new List<SelectOption>();
        List<Account> acclst=[Select Name,id from Account limit 10];
        
        option.add(new SelectOption('-None-','-None-'));
        for(Account ob:acclst)
        {
            option.add(new SelectOption(ob.id,ob.Name));
        }
        
        return option;
    }
    
    public pagereference search(){
        
        opplst = new List<WrapperOpportunity>();
        //opplst  = [select id,name,StageName from opportunity where Accountid=:selected];
        for(Opportunity opp :[select id,name,StageName from opportunity where Accountid=:selected]){
            WrapperOpportunity wr = new WrapperOpportunity();
            wr.flag = false;
            wr.opp = opp;
            opplst.add(wr);
        }
        return NULL;
    }
    
   public pagereference submitStage(){
       List<Opportunity> opps = new List<Opportunity>();
       for(WrapperOpportunity wr : opplst){
           if(wr.flag){
               wr.opp.StageName = 'Closed Lost';
               opps.add(wr.opp);
           }
       }
       
       update opps;
       showThankYou =True ;
          return null;
   }
    
    
      public pagereference submitWonStage(){
       List<Opportunity> opps = new List<Opportunity>();
       for(WrapperOpportunity wr : opplst){
           if(wr.flag){
               wr.opp.StageName = 'Closed Won';
               opps.add(wr.opp);
           }
       }
       
       update opps;
       showThankYou =True;
          return null;
   }
    class WrapperOpportunity {
		public Boolean flag {get;set;}
		public Opportunity opp {get;set;}
	}
}