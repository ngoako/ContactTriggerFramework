public with sharing class ContactHandler implements ContactInterface{
    public static void before_insert(List<SObject> newRecordsList){
        ContactHelper.insertDefaultTitle((List<Contact>) newRecordsList);
    }
    public static void after_insert(List<SObject> newRecordsList, Map<Id, SObject> newRecordsMap){
        ContactHelper.logInsertMessage((List<Contact>) newRecordsList, (Map<Id, Contact>) newRecordsMap);
    }
    public static void before_update(Map<Id,SObject> newRecordsMap, Map<Id,SObject> oldRecordsMap){
        ContactHelper.preventClearEmail((Map<Id,Contact>) newRecordsMap, (Map<Id,Contact>) oldRecordsMap);
    }
    public static void after_update(Map<Id,SObject> newRecordsMap, Map<Id,SObject> oldRecordsMap){
                                        //Map<Id,Contact> newMap, Map<Id, Contact> oldMap
        ContactHelper.updatetheEmailField((Map<Id,Contact>) newRecordsMap, (Map<Id,Contact>) oldRecordsMap);
    }
    public static void before_delete(List<SObject> oldRecordsList, Map<Id,SObject> oldRecordsMap){
        ContactHelper.preventDeletionVip((List<Contact>) oldRecordsList, (Map<Id,Contact>) oldRecordsMap);
    }
    public static void after_delete(Map<Id,SObject> oldRecordsMap){
        ContactHelper.deletionContact((Map<Id,Contact>) oldRecordsMap);
    }
    public static void after_undelete(List<SObject> newRecordsList, Map<Id, SObject> newRecordsMap){
        ContactHelper.updateAccount((List<Contact>) newRecordsList, (Map<Id, Contact>) newRecordsMap);
    }
}