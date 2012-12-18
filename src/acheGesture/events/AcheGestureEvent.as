package acheGesture.events
{
	import acheGesture.GestureManager;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	/**
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class AcheGestureEvent extends Event
	{
		public static const ACHE_GESTURE:String = "acheGesture";
		
		public var gm:GestureManager;
		
		/**
		 * gesture state, all types of state is defined in acheGesture.utils.GestureState 
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