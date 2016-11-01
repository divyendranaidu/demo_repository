public class InputFormTriggerHandler {
    public static void onBefore() {
        for(Input_Form__c ifrm : (List<Input_Form__c>) trigger.new) {
            ifrm.TVM__c = Integer.valueOf(InputFormRequest(ifrm.Amount_1__c, ifrm.Amount_2__c, ifrm.Amount_3__c, ifrm.Amount_4__c, ifrm.Amount_5__c, ifrm.Rate__c));
        }
    }
    
    private static String InputFormRequest(Decimal Amount1, Decimal Amount2, Decimal Amount3, Decimal Amount4, Decimal Amount5, Decimal Rate) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://destinationorg-developer-edition.na35.force.com/services/apexrest/TVMCalc');
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        return response.getBody();
    } 
} 