public with sharing class EmailMissionSpecialist {
  //Public Method
  public void sendMail(String address, String subject, String body) {
    //Create an email message object
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    String[] toAddresses = new List<String>{ address };
    mail.setToAddresses(toAddresses);
    mail.setSubject(subject);
    mail.setPlainTextBody(body);
    //Pass this email message to the built-in sendEmail method
    Messaging.SendEmailResult[] results = Messaging.sendEmail(
      new List<Messaging.SingleEmailMessage>{ mail }
    );
    //call helper method
    inspectResult(results);
  }

  private static Boolean inspectResult(Messaging.SendEmailResult[] results) {
    Boolean sendResults = true;
    // sendEmail returns an array of result objects.
    // Iterate through the list to inspect results.
    // In this class, the methods send only one email,
    // so we should have only one result.
    for (Messaging.SendEmailResult res : results) {
      if (res.isSuccess()) {
        System.debug('Email Sent Success');
      } else {
        sendResults = false;
        System.debug('Error : ' + res.getErrors());
      }
    }
    return sendResults;
  }
}
