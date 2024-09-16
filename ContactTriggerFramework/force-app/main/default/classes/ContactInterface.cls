public interface ContactInterface {
    void before_insert(List<SObject> newRecordsList);
    void after_insert(List<SObject> newRecordsList, Map<Id, SObject> newRecordsMap);
    void before_update(Map<Id,SObject> newRecordsMap, Map<Id,SObject> oldRecordsMap);
    void after_update(Map<Id,SObject> newRecordsMap, Map<Id,SObject> oldRecordsMap);
    void before_delete(List<SObject> oldRecordsList, Map<Id,SObject> oldRecordsMap);
    void after_delete(Map<Id,SObject> oldRecordsMap);
    void after_undelete(List<SObject> newRecordsList, Map<Id, SObject> newRecordsMap);
}