/**
 * @description	API for 'Trigger Pattern'. It provides functionality for retrieving the handlers instances that are
 *				assigned to an object
 * @author 		Dimitrios Sgourdos
 * @date		Created: 12-Jan-2017, Edited: 27-feb-2017
*/
public class COM_TriggerPattern_API {
	
	 /**
	 * @description	NOT to be used outside of TEST Classes!!! Controls when the trigger pattern runs and therefor better handle SOQL and other Limits within Test Data Setup.
	 * @author		Brent Szymborski
	 * @date		Created: 12-Oct-2017
	 */
    public static boolean runTriggerPattern = true;

	/**
	 * @description	Create all the instances of the handlers that corresponds to the given object name.
	 * @author		Dimitrios Sgourdos, Brent Szymborski
	 * @date		Created: 12-Jan-2016, Update: 12-Oct-2017
	 * @param		objectName    The API name of the object with which the handlers are assigned
	 * @return		The instances of the handlers that corresponds to the given object name
	 */
	public static List<ICOM_TriggerHandler> getObjectTriggerHandlers(String objectName) {
		List<ICOM_TriggerHandler> icomList = new List<ICOM_TriggerHandler>();
        if(runTriggerPattern)
        	icomList = COM_TriggerPattern_Service.getObjectTriggerHandlers(objectName);
		return icomList;
	}
	
	/**
	 * @description	Implements the general template that a trigger can have to execute all the handlers.
	 * @author		Dimitrios Sgourdos, Brent Szymborski
	 * @date		Created: 27-Feb-2017, Update: 12-Oct-2017
	 * @param		objectName       The API name of the object with which the handlers are assigned
	 * @return		The instances of the handlers that corresponds to the given object name
	 */
	public static void executeObjectTriggerHandlers(String objectName) {
		if(runTriggerPattern)
			COM_TriggerPattern_Service.executeObjectTriggerHandlers(objectName, false);
	}
}