/**
 * @description	Implements the test for the Data Accessor layer of the 'Trigger Pattern' tool
 * @author		Dimitrios Sgourdos
 * @date		Created: 12-Jan-2017, Edited: 15-May-2017
 */
@isTest
private class COM_TriggerPattern_DataAccesssorTest {
	
	/**
	 * @description	Test the function getObjectTriggerHandlersAssignments.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 12-Jan-2017, Edited: 15-May-2017
	 */
	static testMethod void getObjectTriggerHandlersAssignmentsTest() {
		List<Trigger_Handler_Assignment__mdt> results = COM_TriggerPattern_DataAccesssor.getObjectTriggerHandlersAssignments(
																						'My_Object_Test_Coverage__c');
		system.assertNotEquals(NULL, results, 'Error in retrieving object and handlers assignments');
	}
}