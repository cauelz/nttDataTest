global class SchedulableAccount implements Schedulable {
    global void execute(SchedulableContext sc) {
        UnactiveAccountsBatch b = new UnactiveAccountsBatch(); 
        database.executebatch(b);
     }

     //apexScheduledJob j = new apexScheduledJob ();
     //   String sch = '0 0 0,4,8,12,16,20 ? * MON-FRI';
     //   System.schedule('My Job', sch, j);
}
