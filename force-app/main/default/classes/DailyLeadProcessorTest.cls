@isTest
private class DailyLeadProcessorTest {
  public static string CRON_EXP = '0 0 1 * * ?';
  @isTest
  static void testDailyLeadProcessor() {
    List<Lead> lList = new List<Lead>();
    for (Integer i = 0; i < 200; i++) {
      Lead leadsnew = new Lead(
        LastName = 'Dreamforce' + i,
        Company = 'Test1 Inc.',
        Status = 'Open - Not Contacted'
      );

      //lList.add(leadsnew);
    }
    insert lList;
    Map<Id, Lead> leadmap = new Map<Id, Lead>(lList);
    List<Id> leadsIdnew = new List<Id>(leadmap.keySet());
    Test.startTest();
    String jobId = System.schedule(
      'DailyLeadProcessor',
      CRON_EXP,
      new DailyLeadProcessor()
    );
    List<Task> lt = [SELECT Id FROM Task WHERE WhatId = :leadsIdnew];
    System.assertEquals(0, lt.size(), 'Task exist before jobs has run');
    Test.stopTest();
    lt = [SELECT Id FROM Task WHERE WhatId = :leadsIdnew];
    System.assertEquals(leadsIdnew.size(), lt.size(), 'Task were Not Created');
  }
}
