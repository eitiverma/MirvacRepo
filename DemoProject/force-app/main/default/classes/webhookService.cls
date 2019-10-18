@RestResource(urlMapping='/webhook/*')
global class webhookService {
    
    @HttpPost
    global static void getwebhook() {
        String callback = RestContext.request.params.get('name');
        system.debug('callback ======'+callback );
        // buildMessages gets FeedItems
        //List<Message> messages = buildMessages();
       
        //RestResponse res = RestContext.response;
        //res.addHeader('Content-Type', 'application/javascript');
        //res.responseBody = Blob.valueOf(callback + '(' + JSON.serialize(messages) + ')');
        
    }
    // ...buildMessages...
}