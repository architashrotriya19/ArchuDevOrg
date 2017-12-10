global class ScheduleBatchYearAmountUpdate implements Schedulable {
    
       //BatchYearAmountUpdate b = new BatchYearAmountUpdate();
       //StaticResource sr = [select body from StaticResource where name = 'Flag_Update_Query'];   
       //Blob bodyBlob = sr.Body;
       //String query = bodyBlob.toString();  
       //return Database.getQueryLocator(query);
       //List<Opportunity> opptys  = query.id;
    
      global void execute(SchedulableContext SC) {
       // List<Opportunity> opptys =bodyBlob.toString();
       BatchYearAmountUpdate b = new BatchYearAmountUpdate();
       Database.executeBatch(b);
      }

}