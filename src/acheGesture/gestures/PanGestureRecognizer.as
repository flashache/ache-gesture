package acheGesture.gestures
{
	import acheGesture.GestureManager;
	import acheGesture.events.AcheGestureEvent;
	import acheGesture.utils.GestureState;
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
	public class PanGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _hasBegan:Boolean = false;
		
		private var _sX:Number;
		private var _sY:Number;
		
		public function PanGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean = false)
		{
			super(GestureType.PAN, priority, requireGestureRecognizerToFail, true);
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			var t:Touch = ts[0];
			var validate:Boolean;
			if(t.phase == TouchPhase.BEGAN)
			{
				_sX = t.globalX;
				_sY = t.globalY;
			}
			if(t.phase == TouchPhase.MOVED)
			{
				if(!_hasBegan && _callBack.began)  gestureBegan();
				_hasBegan = true;
				validate = true;
			}
			if(t.phase == TouchPhase.ENDED)
			{
				if(_hasBegan) validate = true;	//如果已经识别滚动的手势，那在手势离开的瞬间，此手势也应该是有效的，
												//如果同时绑定了Tab等一些等待TouchPhase.ENDED的手势，可放置冲突
				_hasBegan = false;	
			}
			return validate;
		}
		
		override public function updateValue(ts:Vector.<Touch>):Boolean 
		{ 
			var t:Touch = ts[0];
			var dx:Number = t.globalX - t.previousGlobalX;
			var dy:Number = t.globalY - t.previousGlobalY;
			if(_callBack.changed)
			{
				_result.state = GestureState.BEGAN;
				_result.dx = dx;
				_result.dy = dy;
				_callBack.changed(_result);
			}
			if(t.phase == TouchPhase.ENDED)
			{
				_hasBegan = false;
				gestureEnded();
			}
			return _hasBegan;
		}
		
	}
	
}