/*
 * Created by ashcherbanyuk on 7/24/2019.
 */
public virtual class Util_TriggerHandlerImplementation implements Util_ITriggerHandler, Queueable {

//	protected SObject[] triggerNew;
//	protected SObject[] triggerOld;
//	protected Map<Id, SObject> triggerNewMap;
//	protected Map<Id, SObject> triggerOldMap;

	private SObject[] updatedRecordsList = new SObject[]{};
	private Map<Id, SObject> updatedRecordsMap = new Map<Id, SObject>();

//	private Boolean isRecursion = false;

	//TODO METHODS to Interface!!!!!!

//	protected void setRecursion(Boolean value) {
//		this.isRecursion = value;
//	}
//
//	protected void toggleRecursion() {
//		this.isRecursion = !this.isRecursion;
//	}
//
//	protected Boolean getRecursion() {
//
//		return this.isRecursion;
//	}


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

//	public void setTriggerNew(SObject[] triggerNew) {
//		this.triggerNew = triggerNew;
//	}
//
//	public void setTriggerOld(SObject[] triggerOld) {
//		this.triggerOld = triggerOld;
//	}
//
//	public void setTriggerNewMap(Map<Id, SObject> triggerNewMap) {
//		this.triggerNewMap = triggerNewMap;
//	}
//
//	public void setTriggerOldMap(Map<Id, SObject> triggerOldMap) {
//		this.triggerOldMap = triggerOldMap;
//	}


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

//	//	TODO Only needed scope of records !
//		System.debug(triggerNew);
//		System.debug(triggerOld);
//		System.debug(triggerNewMap);
//		System.debug(triggerOldMap);
	}


//	@Future
//	public static virtual void onAfterInsertFutureFunction() {
//		// Just empty implementation
//	}
//
//	@Future
//	public virtual void onAfterUpdateFutureFunction() {
//		// Just empty implementation
//	}
//
//	@Future
//	public virtual void onAfterDeleteFutureFunction() {
//		// Just empty implementation
//	}
//
//	@Future
//	public virtual void onAfterUndeleteFutureFunction() {
//		// Just empty implementation
//	}
}