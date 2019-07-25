/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public without sharing class Util_TriggerPattern_DataAccesssor {


	public static Trigger_Handler_Assignment__mdt[] getObjectTriggerHandlersAssignments(String objectName) {

		return [
			SELECT	MasterLabel, HandlerName__c, IsActive__c, Object_API_Name__c, SequenceNumber__c
			FROM	Trigger_Handler_Assignment__mdt
			WHERE	Object_API_Name__c = :objectName
			AND		IsActive__c = true
			ORDER BY SequenceNumber__c
		];

	}

}