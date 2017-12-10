public class DomNamespaceSample
{
    
    public void sendRequest(String endpoint)
    {
        String soapNS = 'http://schemas.xmlsoap.org/soap/envelope/';
        String servicePrefix ='glob';
        String serviceNS = 'http://www.myservice.com/services/MyService/';
        
        // Create the request envelope
        DOM.Document doc = new DOM.Document();
        dom.XmlNode envelope = doc.createRootElement('Envelope', soapNS, 'soapenv');
        envelope.setNamespace(servicePrefix, serviceNS);
        
        dom.XmlNode body = envelope.addChildElement('Body', soapNS, null);     
        body.addChildElement('echo', serviceNS, 'req').addChildElement('category', serviceNS, null).addTextNode('classifieds');
        
        System.debug('Request XML:' + doc.toXmlString());
        
        // Send the request
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'text/xml');      
        req.setBodyDocument(doc);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        System.assertEquals(500, res.getStatusCode());
        
        dom.Document resDoc = res.getBodyDocument();      
        envelope = resDoc.getRootElement();
        
        System.assertEquals('classifieds', envelope.getChildElement('Body', soapNS).getChildElement('echo', serviceNS).getChildElement('category', serviceNS).getText());
    }
}