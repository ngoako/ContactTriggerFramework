trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    // Call the trigger dispatcher and pass it an instance of the ContactTriggerHandler and Trigger.opperationType
    TriggerDispatcher.Run(new ContactTriggerHandler(), Trigger.operationType);

}