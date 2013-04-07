package acheGesture.events
{
	import acheGesture.GestureManager;
	
	import flash.geom.Point;
	
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
		
		/**
		 *  GestureManager instance that related to this object
		 */		
		public var gm:GestureManager;
		
		/**
		 * gesture state, all types of state is defined in acheGesture.utils.GestureState
		 * 
		 * @see acheGestrue.utils.GestureState
		 */		
		public var state:String;
		
		/**
		 * delta x value
		 * Pan gesture for example, dx is the delta x value updated every time user's finger moves 
		 */		
		public var dx:Number;
		
		/**
		 * delta y value
		 * Pan gesture for example, dy is the delta y value updated every time user's finger moves 
		 */	
		public var dy:Number;
		
		/**
		 *  
		 */		
		public var localLocation:Point;
		
		/**
		 * delta scale value
		 * Pinch gesutre use this value
		 */		
		public var dScale:Number;
		
		/**
		 *  The rotation of the gesture in radians since its last change.
		 */		
		public var rotation:Number;
		
		/**
		 * time interval for some specific gesture
		 * Swipe gesture for example, interval is the time interval when swip happen 
		 */		
		public var interval:Number;
		
		/**
		 * possible state of some speicfic gesture
		 * Tap gesture for example, before touch end, the possilbe value will come along with this object to indicate that if the tap gesture is possible to recognize 
		 */		
		public var possible:Boolean;
				
		/**
		 * Constroctor
		 *  
		 * @param type		Event type, use AcheGestureEvent.ACHE_GESTURE
		 * @param gm		GestureManager instance that related to this object
		 * @param state		What state of the gesture when this happen, see ache.Gestrue.utils.GestureState
		 * 
		 */		
		public function AcheGestureEvent(type:String, gm:GestureManager, state:String = "")
		{
			this.gm = gm;
			this.state = state;
			super(type, false, null);
		}
	}
}