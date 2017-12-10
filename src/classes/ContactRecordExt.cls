public class ContactRecordExt {

  Contact newCon {get;set;}
  public Id accoutId {get;set;}
  Id parentId{get;set;}
 public ContactRecordExt(){
      //newCon = (Contact)con.getRecord();
   }
   public ContactRecordExt(ApexPages.StandardController con){
      newCon = (Contact)con.getRecord();
      parentId = newCon.accountId;
       
     //MySObject__c record = (MySObject__c)ctrl.getRecord();
   // Id parentId = record.ParentField__c;
    // Do something with parentId
   }

   public pagereference save(){
     // Account a = New Account(Name = newCon.FirstName + ' ' + newCon.LastName);
   //.. Insert a;
      newCon.AccountID = parentId;
      insert newCon;

      Pagereference pr = New PageReference('/' + accoutId);
      return pr;
   }

}