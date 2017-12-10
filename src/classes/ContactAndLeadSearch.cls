public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String keyword)
    {
        list<list<sObject>> sobjects = [find :keyword IN ALL FIELDS Returning lead(FirstName, LastName), contact(firstname, lastname)];
        
        return sobjects;
    }
}