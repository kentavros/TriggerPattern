/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public with sharing class Util_TriggerPattern_Service {

	public static void initObjectTriggerHandlers(String objectName) {

		Util_ITriggerHandler[] handlerList = getObjectTriggerHandlers(objectName);



		if (!handlerList.isEmpty()) {

			executeHandlerSynchronously(handlerList.remove(0));

			executeHandlerAsynchronously(handlerList);

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

	private static void executeHandlerSynchronously(Util_ITriggerHandler handler) {

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

//	//TODO !!!! SET THIS VALUE BEFORE EXECUTE QUEUEAble
//	 private static void setTriggerValues(Util_ITriggerHandler[] handlerList) {
//
//		 if (!handlerList.isEmpty()) {
//
//			 for (Util_ITriggerHandler handler : handlerList) {
//
//				 handler.setTriggerNew(Trigger.new);
//				 handler.setTriggerOld(Trigger.old);
//				 handler.setTriggerNewMap(Trigger.newMap);
//				 handler.setTriggerOldMap(Trigger.oldMap);
////				 System.enqueueJob(handler);
//			 }
//		 }
//	 }

	private static void executeHandlerAsynchronously(Util_ITriggerHandler[] handlerList) {

		for (Util_ITriggerHandler handler : handlerList) {

			if (Trigger.isAfter) {

				if (Trigger.isInsert) {
					handler.setTriggerNew(Trigger.new);
					handler.setTriggerNewMap(Trigger.newMap);
				}
				else if (Trigger.isUpdate) {
					handler.setTriggerNew(Trigger.new);
					handler.setTriggerOld(Trigger.old);
					handler.setTriggerNewMap(Trigger.newMap);
					handler.setTriggerOldMap(Trigger.oldMap);
				}
				else if (Trigger.isDelete) {
					handler.setTriggerOld(Trigger.old);
					handler.setTriggerOldMap(Trigger.oldMap);
				}
				else if (Trigger.isUndelete) {
					handler.setTriggerNew(Trigger.new);
					handler.setTriggerNewMap(Trigger.newMap);
				}

				Id jobId = System.enqueueJob(handler);
				System.debug(jobId);

			}

		}

	}


}