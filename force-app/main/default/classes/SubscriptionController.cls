public class SubscriptionController {
    
    public static void updateSharedSolarSystem (list<string> SharedSystems){
        //needs to be updated from the bottom for proper code call.
    }
    
    public static boolean validateEffectivityDate(list<Subscription__c> newSubscriptions, string triggerType){
        
        boolean check =false;
        
        set<id> contactSubscribers = new set<id>();
        set<id> sharedSystems = new set<id>();
        list<date> SEDs = new list<date>();
        
        if(newSubscriptions!=null){
            for(Subscription__c subs : newSubscriptions){
                contactSubscribers.add(subs.Subscription_Contact__c);
                sharedSystems.add(subs.Shared_Solar_System__c);
                SEDs.add(subs.Effectivity_Date__c); 
            }
        }
        
        map<id,subscription__c> trigContactSubscriptions = new map<id,subscription__c>([select id,Effectivity_Date__c,Name,Shared_Solar_System__c,Subscription_Contact__c from subscription__c where Subscription_Contact__c in: contactSubscribers]);
        map<id,Shared_Solar_System__c> trigSharedSystems = new Map<id,Shared_Solar_System__c>([select id,Effectivity_Date__c,Name from Shared_Solar_System__c where id in: sharedSystems]);
        
        if(newSubscriptions!=null){
            for(subscription__c subs : newSubscriptions){
                if(triggerType=='isInsert'){
                    if(trigContactSubscriptions!=null){
                        if(trigContactSubscriptions.containsKey(subs.Id)){
                            check= false;
                            break;
                        }
                    }
                }
                
                
                else if(subs.Shared_Solar_System__c == trigContactSubscriptions.get(subs.Id).Shared_Solar_System__c){
                    if(trigContactSubscriptions!=null){
                        for(id key : trigContactSubscriptions.keySet()){
                            if(subs.Effectivity_Date__c >= trigContactSubscriptions.get(key).Effectivity_Date__c){
                                system.debug('The Effectivity Date Must be changed to something else. It currently starts the same or before another subscription has completed');
                                check= false;
                                break;
                            }
                            else if(subs.Effectivity_Date__c < trigContactSubscriptions.get(key).Effectivity_Date__c){
                                if(triggerType=='isInsert'){
                                    //insert subs;
                                    check=true;
                                }
                                if(triggerType=='isUpdate'){
                                    //update subs;
                                    check = true;
                                }
                            }
                        }
                    }
                }
            }
            
        }
        //Update Shared Solar System if subscription
        if(trigSharedSystems!=null && newSubscriptions!= null){
            for(id key : trigSharedSystems.keySet()){
                for(subscription__c subs : newSubscriptions){
                    if((trigSharedSystems.get(key).Effectivity_Date__c<subs.Effectivity_Date__c)&&(trigSharedSystems.get(key).id==subs.Shared_Solar_System__c)){
                        Shared_Solar_System__c sss = trigSharedSystems.get(key);
                        sss.Effectivity_Date__c=subs.Effectivity_Date__c ;
                        upsert sss;
                    }
                }
            }
        }
        return check;
    }
    
}