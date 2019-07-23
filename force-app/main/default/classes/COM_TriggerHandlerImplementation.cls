/**
 * @description	Basic Implementation of the 'ICOM_TriggerHandler' interface. This implementation will be a backbone
 *				that other implementations will extend in order to avoid having empty functions inside each
 *				implementation
 * @author		Dimitrios Sgourdos
 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
 */
public virtual class COM_TriggerHandlerImplementation implements ICOM_TriggerHandler {
	
	/**
	 * @description	Function to be called when the trigger is called on the before insert status.
	 *				When this function is called the trigger.new is available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onBeforeInsertFunction() {
		// Just empty implementation
	}
	
	/**
	 * @description	Function to be called when the trigger is called on the before update status.
	 *				When this function is called the Trigger.oldMap, Trigger.newMap, Trigger.old, Trigger.new are
	 *				available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onBeforeUpdateFunction() {
		// Just empty implementation
	}
	
	/**
	 * @description	Function to be called when the trigger is called on the before delete status.
	 *				When this function is called the Trigger.oldMap, Trigger.old are available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onBeforeDeleteFunction() {
		// Just empty implementation
	}
	
	/**
	 * @description	Function to be called when the trigger is called on the after insert status.
	 *				When this function is called the Trigger.newMap, Trigger.new are available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onAfterInsertFunction() {
		// Just empty implementation
	}
	
	/**
	 * @description	Function to be called when the trigger is called on the after update status.
	 *				When this function is called the Trigger.oldMap, Trigger.newMap, Trigger.old, Trigger.new are
	 *				available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onAfterUpdateFunction() {
		// Just empty implementation
	}
	
	/**
	 * @description	Function to be called when the trigger is called on the after delete status.
	 *				When this function is called the Trigger.oldMap, Trigger.old are available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onAfterDeleteFunction() {
		// Just empty implementation
	}
	
	/**
	 * @description	Function to be called when the trigger is called on the after undelete status.
	 *				When this function is called the Trigger.newMap is available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2017, Edited: 21-Feb-2017
	*/
	public virtual void onAfterUndeleteFunction() {
		// Just empty implementation
	}
}