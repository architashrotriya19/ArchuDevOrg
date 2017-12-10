@isTest 
private class TestVerifyDate {
static testMethod void TestVerifyDate() {
  VerifyDate.CheckDates(System.today(),System.today().addDays(10));
    system.debug(System.today());
   VerifyDate.CheckDates(System.today(),System.today().addDays(78));
}
}