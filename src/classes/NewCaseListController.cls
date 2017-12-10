public with sharing class  NewCaseListController {

    public  List<Case> getNewCases(){
   
        list<case> caselist = new list<case>();
        
        caselist =[select id,CaseNumber from case where status ='New'];
       return caselist;
        
    }
}