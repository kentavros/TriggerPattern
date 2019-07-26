/*
 * Created by ashcherbanyuk on 7/24/2019.
 */
public virtual class Util_TriggerHandlerImplementation implements Util_ITriggerHandler, Queueable {

	protected SObject[] triggerNew;
	protected SObject[] triggerOld;
	protected Map<Id, SObject> triggerNewMap;
	protected Map<Id, SObject> triggerOldMap;

	public void setTriggerNew(SObject[] triggerNew) {
		this.triggerNew = triggerNew;
	}

	public void setTriggerOld(SObject[] triggerOld) {
		this.triggerOld = triggerOld;
	}

	public void setTriggerNewMap(Map<Id, SObject> triggerNewMap) {
		this.triggerNewMap = triggerNewMap;
	}

	public void setTriggerOldMap(Map<Id, SObject> triggerOldMap) {
		this.triggerOldMap = triggerOldMap;
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




		System.debug(triggerNew);
		System.debug(triggerOld);
		System.debug(triggerNewMap);
		System.debug(triggerOldMap);
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