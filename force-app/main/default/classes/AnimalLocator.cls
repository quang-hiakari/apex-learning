public with sharing class AnimalLocator {
    public AnimalLocator() {

    }

    public static String getAnimalNameById(Integer searchId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint = ('https://th-apex-http-callout.herokuapp.com/animals/' + searchId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        //Parse JSON response
        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped()
    }
}
