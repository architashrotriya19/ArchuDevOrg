global class ScheduleClassEx implements Schedulable{
   global void execute(SchedulableContext SC) {
       BatchClassEx b = new BatchClassEx();
       Database.executeBatch(b);
   }
}