package acheGesture.data
{
	/**
	 * Config class for GestureManager.add method
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class GestureVars
	{
		/** @private **/
		protected var _vars:Object;
		
		public function GestureVars(vars:Object=null)
		{
			_vars = {};
			if (vars != null) {
				for (var p:String in vars) {
					_vars[p] = vars[p];
				}
			}
		}
		
		/** @private **/
		protected function _set(property:String, value:*):GestureVars {
			if (value == null) {
				delete _vars[property]; //in case it was previously set
			} else {
				_vars[property] = value;
			}
			return this;
		}
		
		public function prop(property:String, value:*):GestureVars {
			return _set(property, value);
		}
		
		public function dispatchEvent(value:Boolean):GestureVars {
			return _set("dispatchEvent", value);
		}
		
		/**
		 * When GestureManager receive touch event from the target display object, it will call this callback function.
		 */		
		public function onTouch(value:Function):GestureVars { return _set("onTouch", value); }	
		
		/**
		 * Tap gesture config object, recommend to use TapGesture class
		 * @see acheGesture.TapGesture 
		 */		
		public function onTap(value:Object):GestureVars  { return _set("tap", value); }	
		
		/**
		 * Double tap gesture config object, recommend to use DoubleTapGesture class
		 * @see acheGesture.DoubleTapGesture 
		 */	
		public function onDoubleTap(value:Object):GestureVars { return _set("doubleTap", value); }

		/**
		 * Pan gesture config object, recommend to use PanGesture class
		 * @see acheGesture.PanGesture 
		 */	
		public function onPan(value:Object):GestureVars { return _set("pan", value); }

		/**
		 * Swipe gesture config object, recommend to use SwipeGesture class
		 * @see acheGesture.SwipeGesture 
		 */	
		public function onSwipe(value:Object):GestureVars { return _set("swipe", value); }
		
		/**
		 * Hold gesture config object, recommend to use HoldGesture class
		 * @see acheGesture.HoldGesture 
		 */	
		public function onHold(value:Object):GestureVars { return _set("hold", value); }
		
		/**
		 * Pinch gesture config object, recommend to use PinchGesture class
		 * @see acheGesture.PinchGesture 
		 */	
		public function onPinch(value:Object):GestureVars { return _set("pinch", value); }
		
		public function onTrigger(value:Function):GestureVars {
			return _set("onTrigger", value);
		}
		
		public function get vars():Object {
			return _vars;
		}
	}
}