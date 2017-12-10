trigger DesciptionUpdate on Contact (Before insert ,Before update, Before Delete)
{
     if(!Trigger.isDelete){
    For(Contact contact :Trigger.new)
    {
        If(Trigger.isInsert){
    contact.description= 'Contact ceated successfully' + userinfo.getUserName();
        }
        If (Trigger.isUpdate)
        {
    contact.description= 'Contact Updated successfully' + userinfo.getUserName();   
        }
    } 
}
    Else
    {
      For(Contact contact :Trigger.Old)   
      {
        If(contact.accountId ==NULL)   
        {
            Contact.adderror ('You are not auothorize to delete the field');
        }
      } 
    }
}