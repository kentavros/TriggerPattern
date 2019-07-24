/*
 * Created by ashcherbanyuk on 7/24/2019.
 */
global interface Util_ITriggerHandler {

	void onBeforeInsertFunction();

	void onBeforeUpdateFunction();

	void onBeforeDeleteFunction();

	void onAfterInsertFunction();

	void onAfterUpdateFunction();

	void onAfterDeleteFunction();

	void onAfterUndeleteFunction();
}