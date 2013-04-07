package acheGesture.gestures
{
	import acheGesture.GestureManager;
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
	public class DoubleTapGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _interval:Number = 300;
		
		private var _max_dist:Number = 80;
		
		private var _hasOccupied:Boolean;
		
		private var _t:Timer;
		
		private var _count:uint;
		
		private var _validate:Boolean = false;
		
		private var _sx:Number = 0;
		private var _sy:Number = 0;
		
		public function DoubleTapGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean=false)
		{
			super(GestureType.DOUBLE_TAP, priority, requireGestureRecognizerToFail);
			_t = new Timer(_interval, 1);
			_t.addEventListener(TimerEvent.TIMER, onCheck);
			_count = 0;
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			var t:Touch = ts[0];
			var validate:Boolean;
			if(t.phase == TouchPhase.BEGAN)
			{
				if(_count == 0) _failed = false;
			}
			if(t.phase == TouchPhase.MOVED)
			{
				
			}
			if(t.phase == TouchPhase.ENDED)
			{	
				if(_count == 0)
				{
					_count += 1;
					_validate = true;
					_t.reset();
					_t.start();
					//需要记录第一次点击的位置
					_sx = t.globalX;
					_sy = t.globalY;
				}else if(_count == 1){
					if(_validate && Math.abs(t.globalX - _sx) < _max_dist
						&& Math.abs(t.globalY - _sy) < _max_dist)
					{
						//除了时间间隔需要在规定的时间内，而且需要比对第二次点击和第一次点击的位置差异需要保持在一定范围才算有效
						validate = true;
					}
					_count = 0;
					_t.stop();
				}
			}
			return validate;
		}
		
		private function onCheck(e:TimerEvent):void
		{
			_failed = true;
			_validate = false;
			_count = 0;
			if(_requireGestureRecognizerToFail) _g.gestureRecognizerStateChange(this._gestureType, false);
		}
		
	}
}