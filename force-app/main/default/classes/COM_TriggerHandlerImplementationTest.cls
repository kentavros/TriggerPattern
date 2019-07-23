/**
 * @description	Implements the test for the COM_TriggerHandlerImplementation class.
 *				The test is just for the code coverage as the class contains only empty functions.
 * @author		Dimitrios Sgourdos
 * @date		Created: 06-Jan-2016, Edited: 21-Feb-2017
*/
@isTest
private class COM_TriggerHandlerImplementationTest {
	
	/**
	 * @description	Call all the functions of the class. The test is just for the code coverage as the class contains
	 *				only empty functions.
	 * @author		Dimitrios Sgourdos
	 * @date		Created: 06-Jan-2016, Edited: 21-Feb-2017
	*/
	static testMethod void myUnitTest() {
		// Create an instance of the class
		COM_TriggerHandlerImplementation myInstance = new COM_TriggerHandlerImplementation();
		
		// Call all the functions of the class
		myInstance.onBeforeInsertFunction();
		myInstance.onBeforeUpdateFunction();
		myInstance.onBeforeDeleteFunction();
		myInstance.onAfterInsertFunction();
		myInstance.onAfterUpdateFunction();
		myInstance.onAfterDeleteFunction();
		myInstance.onAfterUndeleteFunction();
	}
}