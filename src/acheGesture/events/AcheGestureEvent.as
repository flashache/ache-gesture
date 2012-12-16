package acheGesture.events
{
	import acheGesture.GestureManager;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	public class AcheGestureEvent extends Event
	{
		public static const ACHE_GESTURE:String = "acheGesture";
		
		public var gm:GestureManager;
		
		/**
		 * 手势状态, 所有种类在acheGesture.utils.GestureState 
		 */		
		public var state:String;
			
		public var dx:Number;
		
		public var dy:Number;
		
		public var interval:Number;
		
		public var possible:Boolean;
				
		public function AcheGestureEvent(type:String, gm:GestureManager, state:String)
		{
			this.gm = gm;
			this.state = state;
			super(type, false, null);
		}
	}
}