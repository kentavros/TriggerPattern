/*
 * Created by ashcherbanyuk on 7/24/2019.
 */
public virtual class Util_TriggerHandlerImplementation implements Util_ITriggerHandler, Queueable {

	private SObject[] updatedRecordsList = new SObject[]{};
	private Map<Id, SObject> updatedRecordsMap = new Map<Id, SObject>();

	public virtual void setUpdatedRecordsFromList(SObject[] records) {

		for (SObject record : records) {

			if (record.Id != null) {
				this.updatedRecordsMap.put(record.Id, record);
			}

		}

		this.updatedRecordsList.addAll(records);
	}

	public virtual SObject[] getUpdatedRecordList() {
		return this.updatedRecordsList;
	}

	public virtual void setUpdatedRecordsFromMap(Map<Id, SObject> records) {
		this.updatedRecordsMap.putAll(records);
		this.updatedRecordsList = records.values();
	}

	public virtual Map<Id, SObject> getUpdatedRecordsMap() {
		return this.updatedRecordsMap;
	}

	public virtual void onBeforeInsertFunction() {
		// Just empty implementation
	}

	public virtual void onBeforeUpdateFunction() {
		// Just empty implementation
	}

	public virtual void onBeforeDeleteFunction() {
		// Just empty implementation
	}

	public virtual void onAfterInsertFunction() {
		// Just empty implementation
	}

	public virtual void onAfterUpdateFunction() {
		// Just empty implementation
	}

	public virtual void onAfterDeleteFunction() {
		// Just empty implementation
	}

	public virtual void onAfterUndeleteFunction() {
		// Just empty implementation
	}

	public virtual void execute(QueueableContext context) {

		System.debug(updatedRecordsList);
		System.debug(updatedRecordsList.size());
		System.debug(updatedRecordsMap);
		System.debug(updatedRecordsMap.size());

	}
}