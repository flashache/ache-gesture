package acheGesture.gestures
{
	import acheGesture.GestureManager;
	import acheGesture.utils.GestureState;
	import acheGesture.events.AcheGestureEvent;
	import acheGesture.utils.GestureType;
	
	import starling.events.Touch;
	import starling.events.TouchPhase;

	/**
	 * @private
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class SwipeGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _point_max:Number = 5;
		private var _interval_max:Number = 0.1;
		
		private var _dx:Number;
		private var _dy:Number;
		private var _interval:Number = 0;
		private var _preTimeStamp:Number = 0;
		
		public function SwipeGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean = false)
		{
			super(GestureType.SWIPE, priority, requireGestureRecognizerToFail);
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			var t:Touch = ts[0];
			var validate:Boolean;
			if(t.phase == TouchPhase.BEGAN)
			{
				_dx = _dy = _interval = _preTimeStamp = 0;
			}else if(t.phase == TouchPhase.MOVED){
//				_inProcess = true;
				_dx = t.globalX - t.previousGlobalX;
				_dy = t.globalY - t.previousGlobalY;
				_interval = t.timestamp - _preTimeStamp;
				_preTimeStamp = t.timestamp;
			}else if(t.phase == TouchPhase.ENDED){
				if(Math.abs(_dx) > _point_max || Math.abs(_dy) > _point_max && _interval < _interval_max)
				{
					validate = true;
				}
//				_inProcess = false;
			}
			return validate;
		}
		
		override public function executeGesturRecognizedCallback():void
		{
			if(_callBack.recognized)
			{
				var result:AcheGestureEvent = new AcheGestureEvent(AcheGestureEvent.ACHE_GESTURE, _g, GestureState.RECOGNIZED);
				result.dx = _dx;
				result.dy = _dy;
				result.interval = _interval;
				_callBack.recognized(result);
			}
		}
		
	}
}