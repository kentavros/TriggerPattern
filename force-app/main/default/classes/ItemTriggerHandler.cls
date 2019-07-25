/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public with sharing class ItemTriggerHandler extends Util_TriggerHandlerImplementation{

	public override void onBeforeInsertFunction() {
		System.debug('Override onBeforeInsertFunction run');
		System.debug(Trigger.new);
	}


}