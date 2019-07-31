/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public with sharing class Util_TriggerPattern_Service {

	private static final String SYNC = 'Sync';
	private static final String ASYNC_UPDATE = 'AsyncAfterUpdate';
	private static final String ASYNC_EXECUTION_ALL = 'AsyncAfterSyncExec';
	private static final Map<String, String> EXECUTION_TYPE = new Map<String, String>{
		SYNC => SYNC,
		ASYNC_UPDATE => 'Async After SObject Sync Update',
		ASYNC_EXECUTION_ALL => 'Async After Sync Execution'
	};
	private static final Integer ASYNC_LIMIT = 50;
	private static Boolean isRecursionOnAfter = false;
	private static Boolean isRecursionOnBefore = false;
	public static Util_ITriggerHandler syncHandler;


	public static void initObjectTriggerHandlers(String objectName) {
		Map<String, Util_ITriggerHandler[]> handlerMap = getObjectTriggerHandlers(objectName);

		executeHandlerSynchronously(handlerMap);
 		executeAsyncHandler(handlerMap, ASYNC_EXECUTION_ALL);

	}


	private static Map<String, Util_ITriggerHandler[]> getObjectTriggerHandlers(String objectName) {
		Map<String, Util_ITriggerHandler[]> resultMap = new Map<String, Util_ITriggerHandler[]>();

		try {

			Map<String, Trigger_Handler_Assignment__mdt[]> assignments = getAssignmentsByExecutionType(Util_TriggerPattern_DataAccesssor.getObjectTriggerHandlersAssignments(objectName));

			for (String key : assignments.keySet()) {

				for (Trigger_Handler_Assignment__mdt assignment : assignments.get(key)) {

					if (resultMap.containsKey(key)) {
						resultMap.get(key).add((Util_ITriggerHandler) Type.forName(assignment.HandlerName__c).newInstance());
					}
					else {
						resultMap.put(key, new Util_ITriggerHandler[]{(Util_ITriggerHandler) Type.forName(assignment.HandlerName__c).newInstance()});
					}

				}

			}

		} catch (Exception e) {
			System.debug('Error - getObjectTriggerHandlers: ' + e.getMessage() + ' Line : ' + e.getLineNumber());
		}

		return resultMap;
	}

	private static void executeHandlerSynchronously(Map<String, Util_ITriggerHandler[]> handlerMap) {
		if (handlerMap.containsKey(SYNC)) {
			Util_ITriggerHandler handler = handlerMap.get(SYNC)[0];

			if (Trigger.isBefore) {

//				if (!isRecursionOnBefore) {
//					isRecursionOnBefore = true;

					if (Trigger.isInsert) {
						handler.onBeforeInsertFunction();
					} else if (Trigger.isUpdate) {
						handler.onBeforeUpdateFunction();
					} else if (Trigger.isDelete) {
						handler.onBeforeDeleteFunction();
					}

//				}
//				else {
//					System.debug('RECURSION Before!!!!!');
//					executeAsyncHandler(handlerMap, ASYNC_UPDATE);
//				}
			}

			if (Trigger.isAfter) {

				if (!isRecursionOnAfter) {
					isRecursionOnAfter = true;

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

					syncHandler = handler;
				}
				else {
					System.debug('RECURSION AFTER!!!!!!!!!!!!!!!!!!!');
					executeAsyncHandler(handlerMap, ASYNC_UPDATE);
				}
			}

		}

	}

	private static void executeAsyncHandler(Map<String, Util_ITriggerHandler[]> handlerMap, String asyncKey) {

		if (handlerMap.containsKey(asyncKey) && Trigger.isAfter) {

			executeQueueable(handlerMap.get(asyncKey), getUpdateRecordsForAsyncAll());

		}

	}

	private static void executeQueueable(Util_ITriggerHandler[] handlerList, SObject[] updatedRecords) {

		for (Util_ITriggerHandler handler : handlerList) {

			handler.setUpdatedRecordsFromList(updatedRecords);
			Id jobId = System.enqueueJob(handler);
			System.debug(jobId);
		}
	}


	private static SObject[] getUpdateRecordsForAsyncAll() {
		SObject[] updatedRecords = new SObject[]{};

		if (syncHandler != null) {
			updatedRecords = syncHandler.getUpdatedRecordList();

			if (updatedRecords.isEmpty()) {
				updatedRecords = Trigger.new;
			}

		}
		else {
			updatedRecords = Trigger.new;
		}

		return updatedRecords;
	}

	private static Map<String, Trigger_Handler_Assignment__mdt[]> getAssignmentsByExecutionType(Trigger_Handler_Assignment__mdt[] assignments) {

		Map<String, Trigger_Handler_Assignment__mdt[]> assignmentsByType = new Map<String, Trigger_Handler_Assignment__mdt[]>();
		Integer asyncAssigment = 0;

		for (Trigger_Handler_Assignment__mdt assignment : assignments) {

			for (String key : EXECUTION_TYPE.keySet()) {

				if (assignment.Handler_Execution__c == EXECUTION_TYPE.get(key)) {

					//Can only be one synchronous assignment
	 				if (key == SYNC && !assignmentsByType.containsKey(key)) {
						assignmentsByType.put(key, new Trigger_Handler_Assignment__mdt[]{assignment});
					}
					//Can only be 50 asynchronous assignments
				 	else if (key != SYNC && asyncAssigment < ASYNC_LIMIT) {

						if (assignmentsByType.containsKey(key)) {

							assignmentsByType.get(key).add(assignment);

						}
						else {
							assignmentsByType.put(key, new Trigger_Handler_Assignment__mdt[]{assignment});
						}

						asyncAssigment++;
					}
				}

			}

		}

		return assignmentsByType;
	}




	//	private static void executeAsyncHandler(Map<String, Util_ITriggerHandler[]> handlerMap){
	//
	//		if (isRecursion || (!isRecursion && Trigger.isAfter)) {
	//
	//			SObject[] updatedRecords = getUpdateRecordsForAsyncAll();
	//
	//			if (handlerMap.containsKey(ASYNC_UPDATE)) {
	//				executeQueueable(handlerMap.get(ASYNC_UPDATE), updatedRecords);
	//			}
	//
	//			if (handlerMap.containsKey(ASYNC_EXECUTION_ALL)) {
	//				executeQueueable(handlerMap.get(ASYNC_EXECUTION_ALL), updatedRecords);
	//			}
	//		}
	//
	//	}


	//	private static void executeAsyncHandlerAfterUpdate(Map<String, Util_ITriggerHandler[]> handlerMap) {
	//
	//		if (handlerMap.containsKey(ASYNC_UPDATE)) {
	//
	////			SObject[] updatedRecords = ();
	//
	//			executeQueueable(handlerMap.get(ASYNC_UPDATE), getUpdateRecordsForAsyncAll());
	//
	////			for (Util_ITriggerHandler handler : handlerMap.get(ASYNC_UPDATE)) {
	////				handler.setUpdatedRecordsFromList(updatedRecords);
	////
	////				Id jobId = System.enqueueJob(handler);
	////				System.debug('Async Update JobID: ' + jobId);
	////
	////			}
	//
	//		}
	//	}

	//	private static void executeAsyncHandlerAfterExecution(Map<String, Util_ITriggerHandler[]> handlerMap) {
	//
	//	 	if (handlerMap.containsKey(ASYNC_EXECUTION_ALL)) {
	//
	//			SObject[] updatedRecords = getUpdateRecordsForAsyncAll();
	//
	//
	//
	//			for (Util_ITriggerHandler handler : handlerMap.get(ASYNC_EXECUTION_ALL)) {
	//				handler.setUpdatedRecordsFromList(updatedRecords);
	//
	//				Id jobId = System.enqueueJob(handler);
	//				System.debug('Async Execution JobID: ' + jobId);
	//			}
	//
	//		}
	//	}


}