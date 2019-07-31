/*
 * Created by ashcherbanyuk on 7/25/2019.
 */
public with sharing class ItemTriggerHandler extends Util_TriggerHandlerImplementation{

	public override void onBeforeInsertFunction() {
		System.debug('Override onBeforeInsertFunction run');
	}

	 public override void onAfterInsertFunction() {
		 System.debug('Override onAfterInsertFunction run');
	 }

	public override void onBeforeUpdateFunction() {
		System.debug('Override onBeforeUpdateFunction run');
	}

	 public override void onAfterUpdateFunction() {
		 System.debug('Override onAfterUpdateFunction run');

	 }


}