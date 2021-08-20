trigger SubscriptionTriggers on Subscription__c (before insert, before update) {
    
    if(trigger.isBefore){
        if(trigger.isUpdate){
            SubscriptionController.validateEffectivityDate(Trigger.new,'isUpdate');
        }
        else if(trigger.isInsert){
            SubscriptionController.validateEffectivityDate(Trigger.new,'isInsert');
        }     
    }	
}