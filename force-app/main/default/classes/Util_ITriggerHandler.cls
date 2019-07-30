/*
 * Created by ashcherbanyuk on 7/24/2019.
 */
global interface Util_ITriggerHandler {

//	void setTriggerNew(SObject[] triggerNew);
//
//	void setTriggerOld(SObject[] triggerOld);
//
//	void setTriggerNewMap(Map<Id, SObject> triggerNewMap);
//
//	void setTriggerOldMap(Map<Id, SObject> triggerOldMap);

	void setUpdatedRecordsFromList(SObject[] updatedRecords);

	void setUpdatedRecordsFromMap(Map<Id, SObject> updatedRecords);

	SObject[] getUpdatedRecordList();

	Map<Id, SObject> getUpdatedRecordsMap();

	void onBeforeInsertFunction();

	void onBeforeUpdateFunction();

	void onBeforeDeleteFunction();

	void onAfterInsertFunction();

	void onAfterUpdateFunction();

	void onAfterDeleteFunction();

	void onAfterUndeleteFunction();

//	/*
//	 * Future methods
//	 */
//	void onAfterInsertFutureFunction();
//
//	void onAfterUpdateFutureFunction();
//
//	void onAfterDeleteFutureFunction();
//
//	void onAfterUndeleteFutureFunction();
}