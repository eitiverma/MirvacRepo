public class AuthCalloutCntr {

 public void basicAuthCallout(){
 HttpRequest req = new HttpRequest();
 req.setEndpoint('http://www.aliexpress.com');
 req.setMethod('GET');

 // Specify the required user name and password to access the endpoint 

 // As well as the header and header information 


 String username = 'eitiverma@gmail.com';
 String password = 'chiku20';

 Blob headerValue = Blob.valueOf(username + ':' + password);
 String authorizationHeader = 'BASIC ' +
 EncodingUtil.base64Encode(headerValue);
 req.setHeader('Authorization', authorizationHeader);
 System.debug('REQUEST ======>'+req);

 // Create a new http object to send the request object 

 // A response object is generated as a result of the request   


 Http http = new Http();
 HTTPResponse res = http.send(req);
 System.debug('RESPONSE ======>'+res.getBody());
  }
 }