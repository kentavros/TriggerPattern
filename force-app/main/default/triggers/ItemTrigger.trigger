trigger ItemTrigger on Item__c (
		before insert,
		before update,
		before delete,
		after insert,
		after update,
		after delete,
		after undelete
) {

	Util_TriggerPattern_API.executeObjectTriggerHandlers();

}