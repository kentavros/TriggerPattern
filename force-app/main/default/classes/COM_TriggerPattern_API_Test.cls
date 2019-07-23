/**
 * @description	Implements the test for the COM_TriggerPattern_API class
 * @author		Dimitrios Sgourdos
 * @date		Created: 12-Jan-2017, Edited: 27-Feb-2016
*/
@isTest
private class COM_TriggerPattern_API_Test {
	
	/**
	 * @description	Test the function getObjectTriggerHandlers.
	 *				The test is only for the code coverage, as the function only have a call to the service layer
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 16-Dec-2016
	 */
	static testMethod void getObjectTriggerHandlersTest() {
		List<ICOM_TriggerHandler> results = COM_TriggerPattern_API.getObjectTriggerHandlers(NULL);
		system.assertEquals(0, results.size(), 'Error in retrieving the handler instances of the object');
	}
	
	/**
	 * @description	Test the function executeObjectTriggerHandlers.
	 *				The test is only for the code coverage, as the function only have a call to the service layer
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 27-Feb-2017
	 */
	static testMethod void executeObjectTriggerHandlersTest() {
		COM_TriggerPattern_API.executeObjectTriggerHandlers(NULL);
	}
}