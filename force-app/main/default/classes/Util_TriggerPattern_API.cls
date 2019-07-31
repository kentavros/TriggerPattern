/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public class Util_TriggerPattern_API {

	private static String objectName = setObjectName();

	public static void executeObjectTriggerHandlers() {
		Util_TriggerPattern_Service.initObjectTriggerHandlers(objectName);
	}

	private static String setObjectName() {

		if (objectName == null) {

			if (Trigger.new != null) {
				objectName = Trigger.new.getSObjectType().getDescribe().getName();
			}
			else if (Trigger.old != null) {
				objectName = Trigger.old.getSObjectType().getDescribe().getName();
			}

		}

		return objectName;
	}
}