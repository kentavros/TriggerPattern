/**
 * @description	Serve as the Service Layer for the needed functions of the Trigger Design Pattern
 * @author 		Dimitrios Sgourdos
 * @date		Created: 12-Jan-2017, 27-Feb-2017
*/
public with sharing class COM_TriggerPattern_Service {
	
	/**
	 * @description	Create all the instances of the handlers that corresponds to the given object name.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 12-Jan-2016
	 * @param		objectName    The API name of the object with which the handlers are assigned
	 * @return		The instances of the handlers that corresponds to the given object name
	 */
	public static List<ICOM_TriggerHandler> getObjectTriggerHandlers(String objectName) {
		// Initialize variables
		List<ICOM_TriggerHandler> results = new List<ICOM_TriggerHandler>();
//		List<Error_Log__c> errorLogList = new List<Error_Log__c>();
		Type tmpType;
		ICOM_TriggerHandler handler;
		
		// Retrieve Trigger Handler Assignments
		List<Trigger_Handler_Assignment__mdt> assigns =
									COM_TriggerPattern_DataAccesssor.getObjectTriggerHandlersAssignments(objectName);
		
		// Create valid handler instances
		for(Trigger_Handler_Assignment__mdt tmpAssign : assigns) {
			try {
				tmpType = Type.forName( tmpAssign.HandlerName__c );
				handler = (ICOM_TriggerHandler) tmpType.newInstance();
				results.add(handler);
			} catch(Exception e) {
//				errorLogList.add( new Error_Log__c(	App_Name__c		= 'Trigger Pattern',
//													Error_Class__c	= tmpAssign.HandlerName__c,
//													Error_Method__c	= 'Instantiation of Handler',
//													Error_LineNumber__c = -1,
//													Error_Type__c		= e.getTypeName(),
//													Error_Message__c	= e.getMessage()) );
			}
		}
		
		// Save possible error logs and return valid handler instances
//		if(errorLogList.size() > 0) {
//			insert errorLogList;
//		}
		
		return results;
	}
	
	
	/**
	 * @description	Implements the general template that a trigger can have to execute all the handlers.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 27-Feb-2017
	 * @param		objectName       The API name of the object with which the handlers are assigned
	 * @param		testCoverFlag    A flag that is used to achieve the code coverage of the function
	 * @return		The instances of the handlers that corresponds to the given object name
	 */
	public static void executeObjectTriggerHandlers(String objectName, Boolean testCoverFlag) {
		// Dynamically instantiate the handler(s)
		List<ICOM_TriggerHandler> handlerList = getObjectTriggerHandlers(objectName);
		
		// For all handlers call the functions depends on the trigger event
		for(ICOM_TriggerHandler handler : handlerList) {
			if (testCoverFlag || Trigger.isBefore ) {
				if (testCoverFlag || Trigger.isInsert ) {
					handler.onBeforeInsertFunction();
				}
				if (testCoverFlag || Trigger.isUpdate ) {
					handler.onBeforeUpdateFunction();
				}
				if (testCoverFlag || Trigger.isDelete ) {
					handler.onBeforeDeleteFunction();
				}
			}
			
			if (testCoverFlag || Trigger.IsAfter ) {
				if (testCoverFlag || Trigger.isInsert ) {
					handler.onAfterInsertFunction();
				}
				if (testCoverFlag || Trigger.isUpdate ) {
					handler.onAfterUpdateFunction();
				}
				if (testCoverFlag || Trigger.isDelete ) {
					handler.onAfterDeleteFunction();
				}
				if (testCoverFlag || Trigger.isUnDelete ) {
					handler.onAfterUndeleteFunction();
				}
			}
		}
	}
}