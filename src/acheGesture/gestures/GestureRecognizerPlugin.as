package acheGesture.gestures
{
	import acheGesture.GestureManager;
	import acheGesture.events.AcheGestureEvent;
	import acheGesture.utils.GestureState;
	
	import starling.events.Touch;

	/**
	 * Base class of all the gesture recognizers
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class GestureRecognizerPlugin
	{
		/** @private **/
		public var _gestureType:String;
		
		/**
		 * @private
		 * 如果_failed为true，说明这次识别确实已经失败，而不是介于成功或者失败中的不可知。
		 * 例如对于长按来说，在短于阈值抬起手指，则确认识别失败，此时_failed是true，在下一次check value的时候这个值会被重置
		 */	
		public var _failed:Boolean = false;
		
		/** @private **/	
		public var _g:GestureManager;
		
		/** @private **/	
		public var _config:Object;
		
		/** @private **/	
		public var _priority:int = 0;
		
		/** @private **/	
		public var _numTouchesRequired:int = 1;
		
		/** @private **/		
		public var _continuous:Boolean = false;
		
		/**
		 * all the callback function will have these types:
		 * recognized， possible， failed， began， changed， ended
		 * 
		 * @private 
		 */		
		public var _callBack:Object;
		
		/** @private **/	
		public var _requireGestureRecognizerToFail:Boolean;
		
		/** @private **/
		protected var _possible:Boolean = true;
		
		/** @private **/
		protected var _result:AcheGestureEvent;
		
		/** @private **/
		public var _shouldReceiveTouch:Function;
		
		/** @private **/
		public function GestureRecognizerPlugin(name:String="", priority:int=0, requireGestureRecognizerToFail:Boolean = false, continuous:Boolean = false, numTouchesRequired:int = 1)
		{
			_gestureType = name;
			_continuous = continuous;
			_requireGestureRecognizerToFail = requireGestureRecognizerToFail;
			_priority = priority || 0;
			_numTouchesRequired = numTouchesRequired;
		}
		
		/**
		 * Inject custom gesture-recognizers which extend this class.
		 * 
		 * @param gestures
		 * 
		 */		
		public static function activate(gestures:Vector.<GestureRecognizerPlugin>):void 
		{
			var i:int = gestures.length;
			while (--i > -1) {
				GestureManager._gesturePlugins[(new (gestures[i] as Class)())._gestureName] = gestures[i];
			}
		}
		
		/** @private **/
		public function _onInitGesture(callback:Object, config:Object, g:GestureManager):Boolean
		{
			this._callBack = callback;
			this._config = config;
			this._g = g;			
			if(_config != null && _config["shouldReceiveTouch"] != null) _shouldReceiveTouch = _config["shouldReceiveTouch"];
			_result = new AcheGestureEvent(AcheGestureEvent.ACHE_GESTURE, _g);		
			return true;
		}
		
		/** @private **/	
		public function executeGesturRecognizedCallback():void
		{
			if(_callBack.recognized)
			{
				_result.state = GestureState.RECOGNIZED;
				_callBack.recognized(_result);
			}
		}
		
		/** @private **/
		public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			return false;
		}
		
		/** @private **/
		public function updateValue(ts:Vector.<Touch>):Boolean
		{
			//return true means this continuous gesture has began to effect, while return false means the gestures has stoped.
			return true;
		}
		
		/** @private **/
		protected function gesturePossible(value:Boolean):void
		{
			_possible = value;
			if(_callBack.possible)
			{
				_result.state = GestureState.POSSIBLE;
				_result.possible = value;
				_callBack.possible(_result);
			}
		}
		
		/** @private **/
		protected function gestureBegan():void
		{
			if(_callBack.began)
			{
				_result.state = GestureState.BEGAN;
				_callBack.began(_result);
			}			
		}
		
		/** @private **/
		protected function gestureEnded():void
		{
			if(_callBack.ended)
			{
				_result.state = GestureState.ENDED;
				_callBack.ended(_result);
			}
		}
	}
}