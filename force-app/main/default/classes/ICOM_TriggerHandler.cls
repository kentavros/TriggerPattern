/**
 * @description	Interface that all trigger handlers should implement in order to follow the
 *				'Trigger Design' pattern.
 * @author		Dimitrios Sgourdos
 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
 */
global interface ICOM_TriggerHandler {
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the before insert status.
	 *				When this function is called the trigger.new is available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onBeforeInsertFunction();
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the before update status.
	 *				When this function is called the Trigger.oldMap, Trigger.newMap, Trigger.old, Trigger.new are
	 *				available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onBeforeUpdateFunction();
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the before delete status.
	 *				When this function is called the Trigger.oldMap, Trigger.old are available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onBeforeDeleteFunction();
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the after insert status.
	 *				When this function is called the Trigger.newMap, Trigger.new are available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onAfterInsertFunction();
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the after update status.
	 *				When this function is called the Trigger.oldMap, Trigger.newMap, Trigger.old, Trigger.new are
	 *				available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onAfterUpdateFunction();
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the after delete status.
	 *				When this function is called the Trigger.oldMap, Trigger.old are available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onAfterDeleteFunction();
	
	/**
	 * @description	Placeholder for the function to be called when the trigger is called on the after undelete status.
	 *				When this function is called the Trigger.newMap is available.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 05-Jan-2017, Edited: 21-Feb-2017
	*/
	void onAfterUndeleteFunction();
}


