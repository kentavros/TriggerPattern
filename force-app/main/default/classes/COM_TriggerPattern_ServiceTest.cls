/**
 * @description	Implements the test for the Service layer of the 'Trigger Pattern' tool
 * @author		Dimitrios Sgourdos
 * @date		Created: 12-Jan-2017, Edited; 27-Feb-2017
 */
@isTest
private class COM_TriggerPattern_ServiceTest {
	
	/**
	 * @description	Test the function getObjectTriggerHandlers.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 12-Jan-2017
	 */
	static testMethod void getObjectTriggerHandlersTest() {
		// Check the function
		List<ICOM_TriggerHandler> results = COM_TriggerPattern_Service.getObjectTriggerHandlers(
																						'My_Object_Test_Coverage__c');
		system.assertNotEquals(NULL, results, 'Error in retrieving the handler instances of the object');
	}
	
	
	/**
	 * @description	Test the function executeObjectTriggerHandlers.
	 *				The test is only for the code coverage, as the function serves only as a template.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 27-Feb-2017
	 */
	static testMethod void executeObjectTriggerHandlersTest() {
		// Check the function - The test is only for the code coverage as the function is only a template
		COM_TriggerPattern_Service.executeObjectTriggerHandlers('My_Object_Test_Coverage__c', true);
	}
}