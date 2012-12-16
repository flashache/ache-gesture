package acheGesture.gestures
{
	import acheGesture.GestureManager;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class ScrollGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _hasBegan:Boolean = false;
		
		public function ScrollGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean = false)
		{
			super("tab", true, priority, requireGestureRecognizerToFail);
		}
		
		override public function checkGesture(t:Touch):Boolean
		{
			var validate:Boolean;
			if(t.phase == TouchPhase.MOVED)
			{
				if(!_hasBegan && _callBack.began) _callBack.began();
				_hasBegan = true;
				validate = true;
				var dx:Number = t.globalX - _g.sX;
				var dy:Number = t.globalY - _g.sY;
				if(_callBack.changed) _callBack.changed(dx, dy);
			}
			if(t.phase == TouchPhase.ENDED)
			{
				if(_hasBegan) validate = true;	//如果已经识别滚动的手势，那在手势离开的瞬间，此手势也应该是有效的，
												//如果同时绑定了Tab等一些等待TouchPhase.ENDED的手势，可放置冲突
				_hasBegan = false;
				if(_callBack.ended) _callBack.ended();
			}
			return validate;
		}
		
		override public function updateValue(t:Touch):void 
		{ 
			var dx:Number = t.globalX - _g.sX;
			var dy:Number = t.globalY - _g.sY;
			if(_callBack.changed) _callBack.changed(dx, dy);
		}
	}
}