public class DailyLeadProcessor implements Schedulable {
  public void execute(SchedulableContext SC) {
    List<Lead> LeadObj = [
      SELECT Id
      FROM Lead
      WHERE LeadSource = NULL
    ];
    for (Lead l : LeadObj) {
      l.LeadSource = 'Dreamforce';
      update l;
    }
  }
}
