public with sharing class ContactDispatcher {
    public static void run(ContactInterface handler, System.TriggerOperation operationType){
        switch on operationType {
            when BEFORE_INSERT {
                handler.before_Insert(Trigger.new);
            }
            when AFTER_INSERT {
                handler.after_Insert(Trigger.new, Trigger.newMap);
            }
            when BEFORE_UPDATE {
                handler.before_Update(Trigger.newMap, Trigger.oldMap);
            }
            when AFTER_UPDATE {
                handler.after_Update(Trigger.newMap, Trigger.oldMap);
            }
            when BEFORE_DELETE{
                handler.before_Delete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_DELETE{
                handler.after_Delete(Trigger.oldMap);    
            }
            when AFTER_UNDELETE{
                handler.after_UnDelete(Trigger.new, Trigger.newMap);    
            }
        }
    }
}