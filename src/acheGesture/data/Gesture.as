package acheGesture.data
{
	/**
	 * @private
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class Gesture
	{
		/**
		 * @private 
		 */		
		public var type:String;
		
		public var config:Object;
		
		public var requireGestureToFail:Gesture;
		
		public var recognized:Function;	
		public var possible:Function;
		public var failed:Function;
		public var began:Function;
		public var changed:Function;
		public var ended:Function;
		public var cancelled:Function;
		
		public function Gesture(type:String="")
		{
			this.type = type;
			this.config = {};
		}
		
		/** @private **/
		protected function _set(property:String, value:*):Gesture {
			if (value == null) {
				delete this[property]; //in case it was previously set
			} else {
				this[property] = value;
			}
			return this;
		}
		
		public function prop(property:String, value:*):Gesture {
			return _set(property, value);
		}
		
		public function onRecognized(value:Function):Gesture { return _set("recognized", value); }
		public function onPossible(value:Function):Gesture { return _set("possible", value); }
		public function onFailed(value:Function):Gesture { return _set("failed", value); }
		public function onBegan(value:Function):Gesture { return _set("began", value); }
		public function onChanged(value:Function):Gesture { return _set("changed", value); }
		public function onEnded(value:Function):Gesture { return _set("ended", value); }
		public function onCancelled(value:Function):Gesture { return _set("cancelled", value); }
		
		public function gestureRecognizerShouldReceiveTouch(value:Function):Gesture { return setConfig("shouldReceiveTouch", value) } ;
			
		public function requireGestureRecognizerToFail(value:Gesture): Gesture { return  _set("requireGestureToFail", value); }
			
		public function setConfig(key:String, value:*):Gesture
		{
			config[key] = value;
			return this;
		}
	}
}