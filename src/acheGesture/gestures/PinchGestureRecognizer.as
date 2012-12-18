package acheGesture.gestures
{
	import acheGesture.utils.GestureType;
	
	import flash.geom.Point;
	
	import starling.events.Touch;
	import starling.events.TouchPhase;

	/**
	 * @private
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class PinchGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _numPointToCheck:int = 3;
		
		private var _x1:Number;
		private var _y1:Number;
		private var _x2:Number;
		private var _y2:Number;
				
		private var _cx:Number = 0;
		private var _cy:Number;
		
		private var _offsetX:Number = 0;
		private var _offsetY:Number = 0;
		
//		private var _location:Point = new Point;
		private var _localLocation:Point;
//		private var _transformVector:Number;	
//		private var _globalPoint:Point = new Point();
		
		private var _d1X:Number;
		private var _d1Y:Number;
		
		private var _d2X:Number;
		private var _d2Y:Number;
		
		
		public function PinchGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean=false)
		{
			super(GestureType.PINCH, priority, requireGestureRecognizerToFail, true, 2);
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			if(ts.length != 2)
			{
				_inProcess = false;	
				_cx = 0;
				_offsetX = _offsetY = 0;
				return false;
			}
			
			var t1:Touch = ts[0];
			var t2:Touch = ts[1];
			
			if(t1.phase == TouchPhase.ENDED || t2.phase == TouchPhase.ENDED)
			{
				_inProcess = false;	
				_cx = 0;
				_offsetX = _offsetY = 0;
				return false;
			}
			
			if(_cx != 0) return true;
			_cx = (t1.globalX + t2.globalX) * 0.5;
			_cy = (t1.globalY + t2.globalY) * 0.5;
			_d1X = t1.globalX - t2.globalX;
			_d1Y = t1.globalY - t2.globalY;
			
			_localLocation = _g.target.globalToLocal(new Point(_cx, _cy), _localLocation);
			
//			_location.x = _cx;
//			_location.y = _cy;
//			_localLocation = _g.target.globalToLocal(_location, _localLocation);
//			_transformVector = new Point(t2.globalX - t1.globalX, t2.globalY - t1.globalY);
//			if(_callBack.changed) _callBack.changed(0, 0, _localLocation.x, _localLocation.y, 1);	
			
			if(_callBack.changed) _callBack.changed(_offsetX, _offsetY, _localLocation.x, _localLocation.y, 1);
			return true;
		}
		
		override public function updateValue(ts:Vector.<Touch>):Boolean
		{
			if(ts.length != 2)
			{
				_inProcess = false;		
				_cx = 0;
				return false;
			}
			
			var t1:Touch = ts[0];
			var t2:Touch = ts[1];
			
			if(t1.phase == TouchPhase.ENDED || t2.phase == TouchPhase.ENDED)
			{
				_inProcess = false;	
				_cx = 0;
				_offsetX = _offsetY = 0;
				return false;
			}
			
			var prevX:Number = _cx;
			var prevY:Number = _cy;
//			var prev
			
			_cx = (t1.globalX + t2.globalX) * 0.5;
			_cy = (t1.globalY + t2.globalY) * 0.5;
			_offsetX = _cx - prevX;
			_offsetY = _cy - prevY;
			_d2X = t1.globalX - t2.globalX;
			_d2Y = t1.globalY - t2.globalY;
			_localLocation = _g.target.globalToLocal(new Point(_cx, _cy), _localLocation);
			
//			var scale:Number = (_d1X != 0) ?  (_d2X /_d1X) : (_d2Y / _d2Y);
			var scale:Number = new Point(_d2X, _d2Y).length / new Point(_d1X, _d1Y).length;
			
			_d1X = _d2X;
			_d1Y = _d2Y;
			
//			var prevLocation:Point = _location.clone();
//			_cx = (t1.globalX + t2.globalX) * 0.5;
//			_cy = (t1.globalY + t2.globalY) * 0.5;
//			_location.x = _cx;
//			_location.y = _cy;
//			_localLocation = _g.target.globalToLocal(_location, _localLocation);
//			
//			var offsetX:Number = _location.x - prevLocation.x;
//			var offsetY:Number = _location.y - prevLocation.y;
//			
//			var currTransformVector:Point = new Point(t2.globalX - t1.globalX, t2.globalY - t1.globalY);	
//			var scale:Number = currTransformVector.length / _transformVector.length;
			if(_callBack.changed) _callBack.changed(_offsetX, _offsetY, _localLocation.x, _localLocation.y, scale);
			
			//返回true，说明这个连续的手势开始作用，当返回false的时候，说明这个连续的手势停止执行
			return true;
		}
	}
}