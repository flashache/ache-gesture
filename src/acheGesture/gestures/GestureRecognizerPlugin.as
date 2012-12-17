package acheGesture.gestures
{
	import acheGesture.GestureManager;
	import acheGesture.core.PropGesture;
	import acheGesture.events.AcheGestureEvent;
	import acheGesture.utils.GestureState;
	
	import flash.display.DisplayObject;
	
	import starling.events.Touch;

	public class GestureRecognizerPlugin
	{
		/**
		 * @private 
		 */		
		public var _gestureType:String;
		
		/**
		 *  是否在一个手势识别的生命周期内
		 */		
		public var _inProcess:Boolean = false;
		
		/**
		 * @private 
		 */		
		public var _g:GestureManager;
		
		/**
		 * @private 
		 */		
		public var _config:Object;
		
		/**
		 * @private 
		 */		
		public var _priority:int = 0;
		
		/**
		 * @private 
		 */		
		public var _numTouchesRequired:int = 1;
		
		/**
		 * @private 
		 */		
		public var _continuous:Boolean = false;
		
		/**
		 * 所有绑定的回调函数，包括回调包括以下6种
		 * recognized， possible， failed， began， changed， ended
		 * @private 
		 */		
		public var _callBack:Object;
		
		/**
		 * @private 
		 */		
		public var _requireGestureRecognizerToFail:Boolean;
		
		protected var _possible:Boolean = true;
		
		protected var _result:AcheGestureEvent;
		
		protected var _shouldReceiveTouch:Function;
		
		public function GestureRecognizerPlugin(name:String="", priority:int=0, requireGestureRecognizerToFail:Boolean = false, continuous:Boolean = false, numTouchesRequired:int = 1)
		{
			_gestureType = name;
			_continuous = continuous;
			_requireGestureRecognizerToFail = requireGestureRecognizerToFail;
			_priority = priority || 0;
			_numTouchesRequired = numTouchesRequired;
		}
		
		public function _onInitGesture(callback:Object, config:Object, g:GestureManager):Boolean
		{
			this._callBack = callback;
			this._config = config;
			this._g = g;			
			if(_config != null && _config["shouldReceiveTouch"] != null) _shouldReceiveTouch = _config["shouldReceiveTouch"];			
			_result = new AcheGestureEvent(AcheGestureEvent.ACHE_GESTURE, _g, GestureState.RECOGNIZED);		
			return true;
		}
		
		/**
		 * 执行识别回调
		 * 离散的手势，在等待状态之后执行
		 */		
		public function executeGesturRecognizedCallback():void
		{
			if(_callBack.recognized)
			{
				_result.state = GestureState.RECOGNIZED;
				_callBack.recognized(_result);
			}
		}
		
		public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			return false;
		}
		
		public function updateValue(ts:Vector.<Touch>):Boolean
		{
			//返回true，说明这个连续的手势开始作用，当返回false的时候，说明这个连续的手势停止执行
			return true;
		}
		
		/**
		 * 注入某一种自定义手势 
		 * @param gestures
		 * 
		 */		
		public static function activate(gestures:Array):void 
		{
			var i:int = gestures.length;
			while (--i > -1) {
				GestureManager._gesturePlugins[(new (gestures[i] as Class)())._gestureName] = gestures[i];
			}
		}
		
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
		
		protected function gestureBegan():void
		{
			if(_callBack.began)
			{
				_result.state = GestureState.BEGAN;
				_callBack.began(_result);
			}			
		}
		
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