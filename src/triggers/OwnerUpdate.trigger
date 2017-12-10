trigger OwnerUpdate on Account (before insert,
                                before update, after insert,after update,before delete, after undelete)
{
    if(Trigger.isBefore)
    {
        if(Trigger.isUpdate || Trigger.isInsert){
            
            //List<Account> acc = new List<Account>(); // but here acc is blank
          // User us = [select Id from User where Title  =:acc.Employee_Id__c] ;
            for(Account acc : Trigger.new){
           //     User us = [select Id from User where Title  =:acc.Employee_Id__c] ;             
                //acc.OwnerId = us.Id;
                // But it this code is not optimul
                // You should not put SOQL inside for loop this is crime
            }
        }
    }
}