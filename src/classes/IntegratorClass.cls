global class IntegratorClass{
    
    /*
String ses = IntegratorClass.doLogin();
DOM.Document doc = IntegratorClass.createDocument(ses,'Normal','Some issue');
DOM.Document response = IntegratorClass.createCase(doc);
*/
    
    public static DOM.Document createCase(DOM.Document doc) {
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://intresting-dev-ed.my.salesforce.com/services/Soap/c/40.0');
        req.setMethod('POST');
        req.setHeader('Content-Type','text/xml'); 
        req.setHeader('SOAPAction', '""');
        req.setBodyDocument(doc);
        HttpResponse res = h.send(req);
        return res.getBodyDocument();
        //return NULL;
    } 
    
    public static DOM.Document createDocument(String sessionid,String caseStatus,String caseSub,string caseOrigin){
        
        String soapNS = 'http://schemas.xmlsoap.org/soap/envelope/';
        String servicePrefix ='urn';
        String servicePrefix2 ='urn1';
        
        String one = 'urn:enterprise.soap.sforce.com';
        String two = 'urn:sobject.enterprise.soap.sforce.com';
        
        
        String xsi='http://www.w3.org/2001/XMLSchema-instance';
        // Create the request envelope
        DOM.Document doc = new DOM.Document();
        dom.XmlNode envelope = doc.createRootElement('Envelope', soapNS, 'soapenv');
        envelope.setNamespace(servicePrefix, one);
        envelope.setNamespace(servicePrefix2, two);
        
        dom.XmlNode header = envelope.addChildElement('Header', soapNS, 'soapenv');
        header.addChildElement('SessionHeader',one,'urn').addChildElement('sessionId',one,'urn').addTextNode(sessionid);
        
        dom.XmlNode body = envelope.addChildElement('Body', soapNS, 'soapenv');     
        dom.XmlNode sobj = body.addChildElement('create',one,'urn').addChildElement('sObjects',one,'urn');
        sobj.setAttribute('xsi:type','urn1:Case');
        sobj.setNamespace('xsi', xsi);
        sobj.addChildElement('Status',null,null).addTextNode(caseStatus);
        sobj.addChildElement('Subject',null,null).addTextNode(caseSub);
        sobj.addChildElement('Origin',null,null).addTextNode(caseOrigin);
        
        //System.debug('Request XML:' + doc.toXmlString());
        return doc;
    }
    
    
    public static String doLogin(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        
        //URL basoapenvUrl = URL.getSalesforceBaseUrl();
        req.setEndpoint('https://login.salesforce.com/services/Soap/c/40.0');
        req.setMethod('POST');
        req.setHeader('Content-Type','text/xml'); 
        req.setHeader('SOAPAction', '""');
        string body = '<?xml version="1.0" encoding="UTF-8"?>'+
            '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:enterprise.soap.sforce.com">'+
            '<soapenv:Header>'+
            '</soapenv:Header>'+
            '<soapenv:Body>'+
            '<urn:login>'+
            '<urn:username>archita.shrotriya@trainee.dev.com</urn:username>'+
            '<urn:password>thelostsymbol09ljxxmkXIwkpgCiLPelkZGP7T</urn:password>'+
            '</urn:login>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';  
        
        req.setBody(body);
        HttpResponse res = h.send(req);
        string outCallResultLogin = '';
        Dom.Document result = res.getBodyDocument();
        Dom.XMLNode address = result.getRootElement();
        //system.debug(address);
        Dom.XmlNode[] nod = address.getChildElements();// ('userId',null).getText();
        return nod[0].getChildElements()[0].getChildElements()[0].getChildElements()[4].getText();
        
    }
    
    
    /* public static String getXml() {
XmlStreamWriter w = new XmlStreamWriter();
w.writeStartElement(null, 'Status', null);
w.writeCharacters('Open');
w.writeEndElement(); //end book

w.writeStartElement(null, 'Origin', null);
w.writeCharacters('Phone');
w.writeEndElement(); //end book

w.writeStartElement(null, 'Subject', null);
w.writeCharacters('This will be the subject');
w.writeEndElement(); //end book
w.writeEndDocument();
String xmlOutput = w.getXmlString();
w.close();
system.debug(xmlOutput);
return xmlOutput;       
}*/
    
}