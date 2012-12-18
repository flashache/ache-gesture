package acheGesture.gestures
{
	import acheGesture.GestureManager;
	import acheGesture.utils.GestureConfigKey;
	import acheGesture.utils.GestureType;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.events.Touch;
	import starling.events.TouchPhase;

	/**
	 * @private
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class HoldGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _timeThreshold:Number = 1000;
		
		private var _timer:Timer;
		
		private var _validate:Boolean;
		
		public function HoldGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean=false)
		{
			super(GestureType.HOLD, priority, requireGestureRecognizerToFail);
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			var t:Touch = ts[0];
			if(t.phase == TouchPhase.BEGAN)
			{
				_validate = false;
				if(_timer == null)
				{
					_timer = new Timer(_timeThreshold, 1);
					_timer.addEventListener(TimerEvent.TIMER, onHoldGestureValidate);
				}
				_timer.reset();
				_timer.start();
				_inProcess = true;
			}
			if(t.phase == TouchPhase.MOVED) 
			{
				_validate = false;
				_timer.reset();
				_timer.stop();
				_inProcess = false;
			}
			if(t.phase == TouchPhase.ENDED) 
			{
				_timer.reset();
				_timer.stop();
				_inProcess = _validate ? true : false;
//				_inProcess = false;
//				_validate = false;
			}
			return _validate;
		}
		
		override public function _onInitGesture(callback:Object, config:Object, g:GestureManager):Boolean
		{
			if(config[GestureConfigKey.TIME_THRESHOLD] != null) _timeThreshold = Number(config[GestureConfigKey.TIME_THRESHOLD]);
			return super._onInitGesture(callback, config, g);
		}
		
		override public function executeGesturRecognizedCallback():void
		{
			super.executeGesturRecognizedCallback();
			_validate = false;
		}
		
		private function onHoldGestureValidate(e:TimerEvent):void
		{
			if(_g._firstG.r && !_g.allowSimultaneous) return;
//			if(_callBack.recognized) _callBack.recognized();
//			executeGesturRecognizedCallback();
			_validate = true;
//			_inProcess = false;
//			trace("======================");
//			if(_requireGestureRecognizerToFail) _g.gestureRecognizerStateChange(this._gestureName, true);
			_g.gestureRecognizerStateChange(this._gestureType, true);
		}
		
	}
}