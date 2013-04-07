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
				_failed = false;
			}
			if(t.phase == TouchPhase.MOVED) 
			{
				_validate = false;
				_timer.stop();
				if(!_validate) _failed = true;
			}
			if(t.phase == TouchPhase.ENDED) 
			{
				_validate = false;
				_timer.stop();
			}
			return _validate;
		}
		
		override public function _onInitGesture(callback:Object, config:Object, g:GestureManager):Boolean
		{
			if(config[GestureConfigKey.TIME_THRESHOLD] != null) _timeThreshold = Number(config[GestureConfigKey.TIME_THRESHOLD]);
			return super._onInitGesture(callback, config, g);
		}
		
		private function onHoldGestureValidate(e:TimerEvent):void
		{
			if(_g._firstG.r && !_g.allowSimultaneous) return;
			_validate = true;
			_g.gestureRecognizerStateChange(this._gestureType, true);
		}
		
	}
	
}