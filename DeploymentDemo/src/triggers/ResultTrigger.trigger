trigger ResultTrigger on Input_Form__c (before insert, before update) {
    InputFormTriggerHandler.onBefore();
}