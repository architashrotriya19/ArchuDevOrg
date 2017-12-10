global class ScheduleSample implements Schedulable {
   global void execute(SchedulableContext SC) {
      BatchDataExample bt = new BatchDataExample();
      Database.executeBatch(bt);
   }

}