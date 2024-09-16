public with sharing class ContactHelper {
    public static void insertDefaultTitle(List<Contact> lstContact){
        //Before Insert
        if(!lstContact.isEmpty()){
            for(Contact con : lstContact){
                if(con.Title == null){
                    con.Title = 'Default Title';
                }
            }
        }
    }
    public static void preventClearEmail(Map<Id,Contact> newMap, Map<Id, Contact> oldMap){
        //Before update
        for (Contact con : newMap.values()) {
            // Prevent the 'Email' field from being cleared
            if (con.Email == null) {
                con.addError('Email cannot be blank.');
            }
        }
    }
    public static void preventDeletionVip(List<Contact> newList, Map<Id, Contact> oldMap){
        //Before Delete
        for (Contact con : oldMap.values()) {
            if (con.Key_Decision_Maker__c) {
                con.addError('Cannot delete Key Decision Maker contacts.');
            }
        }
    }
    public static void logInsertMessage(List<Contact> newList, Map<Id, Contact> oldMap){
        //After Insert
        // Log that a new Contact was created
        for(Contact con : newList){
            System.debug('New Contact created: ' + con.FirstName + ' ' + con.LastName);
        }   
    }
    public static void updatetheEmailField(Map<ID,Contact> newMap, Map<Id, Contact> oldMap){
        //After Update
        for(Contact con : newMap.values()){
            Contact oldCon = oldMap.get(con.Id);
            if(con.Email != oldMap.get(con.Id).Email){
                System.debug('Email updated from ' + oldCon.Email + ' to ' + con.Email);
            }
        }
    }
    public static void deletionContact(Map<Id, Contact> oldMap){
        //After Delete
        for (Contact con : oldMap.values()) {
            System.debug('Contact deleted: ' + con.FirstName + ' ' + con.LastName);
        }
    }
    public static void updateAccount(List<Contact> newList, Map<Id, Contact> oldMap){
        //After Undelete
        for (Contact con : newList) {
            System.debug('Contact restored: ' + con.FirstName + ' ' + con.LastName);
        }
    }
    
}