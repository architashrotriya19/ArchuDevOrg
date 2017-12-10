public class IntegratorRest {
    
    public void basicAuthCallout(){

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://dev29572.service-now.com/api/now/table/incident');
    request.setMethod('POST');
    
    String username = 'Admin';
    String password = 'Thelostsymbol07!';
    
    Blob headerValue = Blob.valueOf(username + ':' + password);
    String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setHeader('Authorization', authorizationHeader);
    // Set the body as a JSON object
    request.setBody('{"active":"yes","caller_id":"Archita","short_description":"incident through Test"}');
    HttpResponse response = http.send(request);
    // Parse the JSON response
    if (response.getStatusCode() != 201) {
        System.debug('The status code returned was not expected: ' +
                     response.getStatusCode() + ' ' + response.getStatus());
    } else {
        System.debug(response.getBody());
    }
    }
    
}