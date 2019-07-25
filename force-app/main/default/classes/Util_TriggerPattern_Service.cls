/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public with sharing class Util_TriggerPattern_Service {

	public static void executeObjectTriggerHandlers(String objectName) {

		Util_ITriggerHandler[] handlerList = getObjectTriggerHandlers(objectName);

		//TODO: DELETE LOOP FOR - Queueble or some async
		for (Util_ITriggerHandler handler : handlerList) {

			if (Trigger.isBefore) {

				if (Trigger.isInsert){
					handler.onBeforeInsertFunction();
				}
				else if (Trigger.isUpdate) {
					handler.onBeforeUpdateFunction();
				}
				else if (Trigger.isDelete) {
					handler.onBeforeDeleteFunction();
				}

			}

			if (Trigger.isAfter) {

				if (Trigger.isInsert) {
					handler.onAfterInsertFunction();
				}
				else if (Trigger.isUpdate) {
					handler.onAfterUpdateFunction();
				}
				else if (Trigger.isDelete) {
					handler.onAfterDeleteFunction();
				}
				else if (Trigger.isUndelete) {
					handler.onAfterUndeleteFunction();
				}

			}

		}


	}

	//TODO: If delete Util_TriggerPattern_API.getObjectTriggerHandlers method, you will need to set private for this method
	public static Util_ITriggerHandler[] getObjectTriggerHandlers(String objectName) {

		Util_ITriggerHandler[] result = new Util_ITriggerHandler[]{};

		try {

			Trigger_Handler_Assignment__mdt[] assignments = Util_TriggerPattern_DataAccesssor.getObjectTriggerHandlersAssignments(objectName);

			for (Trigger_Handler_Assignment__mdt assignment : assignments) {

				result.add((Util_ITriggerHandler) Type.forName(assignment.HandlerName__c).newInstance());

			}

		} catch (Exception e) {

			System.debug('Error - getObjectTriggerHandlers: ' + e.getMessage() + ' Line : ' + e.getLineNumber());

		}

		return result;
	}


}