/*
 * Created by ashcherbanyuk on 7/24/2019.
 */
global interface Util_ITriggerHandler {

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

}