public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('GET');
        HttpResponse response = http.send(req);
        String strResp = '';
        system.debug('******response '+response.getStatusCode());
        system.debug('******response '+response.getBody());
     // If the request is successful, parse the JSON response
     if (response.getStatusCode() == 200) 
     {
         // Deserial JSON string into collections
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
         // get the values in the 'animals' key as a list
        Map<string,object> animals = (map<string,object>) results.get('animal');
         System.debug('Received the following animals:' + animals );
         strResp = string.valueof(animals.get('name'));
         System.debug('strResp >>>>>>' + strResp );
     }
     return strResp ; 
    }
}