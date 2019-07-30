/**
 * @description	Serves as the Data Accessor layer of the 'Trigger Pattern' tool
 * @author		Dimitrios Sgourdos
 * @date		Created: 12-Jan-2017, Edited: 15-May-2017
 */
public without sharing class COM_TriggerPattern_DataAccesssor {
	
	/**
	 * @description	Retrieve all the active assignments of the trigger handlers with the object that corresponds to the
	 *				given object API name.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 12-Jan-2016, Edited: 15-May-2017
	 * @param		objectName    The API name of the object with which the handlers are assigned
	 * @return		The trigger and handlers assignments
	 */
	public static List<Trigger_Handler_Assignment__mdt> getObjectTriggerHandlersAssignments(String objectName) {
		return [SELECT	MasterLabel,
						HandlerName__c,
						IsActive__c,
						Object_API_Name__c
				FROM	Trigger_Handler_Assignment__mdt
				WHERE	Object_API_Name__c = :objectName
				AND		IsActive__c = true
				];
//		return [SELECT	MasterLabel,
//						HandlerName__c,
//						IsActive__c,
//						Object_API_Name__c,
//						SequenceNumber__c
//				FROM	Trigger_Handler_Assignment__mdt
//				WHERE	Object_API_Name__c = :objectName
//				AND		IsActive__c = true
//				ORDER BY SequenceNumber__c];
	}
}