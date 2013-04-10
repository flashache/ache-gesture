package acheGesture.gestures
{
	import acheGesture.utils.GestureType;
	
	import flash.geom.Point;
	
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	/**
	 * @private 
	 * 
	 * TO DO
	 * @author qidonghui
	 * 
	 */
	public class RotationGestureRecognizer extends GestureRecognizerPlugin
	{
		private var _hasBegan:Boolean = false;
		
		private var _x1:Number;
		private var _y1:Number;
		private var _x2:Number;
		private var _y2:Number;
		
		private var _x3:Number;
		private var _y3:Number;
		private var _x4:Number;
		private var _y4:Number;
		
		private var _cx:Number = 0;
		private var _cy:Number = 0;
		
		private var _offsetX:Number = 0;
		private var _offsetY:Number = 0;
		
		private var _localLocation:Point;
		
		private var _angle1:Number;
		private var _angle2:Number;
		
		public function RotationGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean=false)
		{
			super(GestureType.ROTATE, priority, requireGestureRecognizerToFail, true, 2);
			
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{	
			var validate:Boolean = false;
			if(ts.length != 2)
			{
				_cx = 0;
				_offsetX = _offsetY = 0;
				_angle1 = _angle2 = 0;
				if(_hasBegan) validate = true;
				else validate = false;
				return validate;
			}
			
			var t1:Touch = ts[0];
			var t2:Touch = ts[1];
			
			//如果某一个手指抬起来了，此手势结束识别
			if(t1.phase == TouchPhase.ENDED || t2.phase == TouchPhase.ENDED)
			{
				if(_hasBegan) validate = true;
				else validate = false;
			}else{
				if(!_hasBegan && _callBack.began)  gestureBegan();
				if(!_hasBegan)
				{
					_x1 = _y1 = _x2 = _y2 = 0;
					_angle1 = 0;
					_hasBegan = true;
				}		
				validate = true;		
				if(_x1 != 0){
					
				}else{
					_x1 = t1.globalX;
					_y1 = t1.globalY;
					_x2 = t2.globalX;
					_y2 = t2.globalY;			
					_angle1 = 0;
				}
			}			
			return validate;
		}
		
		override public function updateValue(ts:Vector.<Touch>):Boolean
		{
			if(ts.length != 2)
			{
				_hasBegan = false;
				gestureEnded();
				_x1 = _y1 = _x2 = _y2 = 0;
				_angle1 = 0;
				return _hasBegan;
			}
			
			var t1:Touch = ts[0];
			var t2:Touch = ts[1];
			
			if(t1.phase == TouchPhase.ENDED || t2.phase == TouchPhase.ENDED)
			{
				_hasBegan = false;
				gestureEnded();
				_x1 = _y1 = _x2 = _y2 = 0;
				_angle1 = 0;
				return _hasBegan;
			}
			
			_x3 = t1.globalX;
			_y3 = t1.globalY;
			_x4 = t2.globalX;
			_y4 = t2.globalY;
			var div:Number = 0;
			
			var d1:Number = new Point(_x3 - _x1, _y3 - _y1).length;
			var d2:Number = new Point(_x4 - _x2, _y4 - _y2).length;
			if(d1 == 0 && d2 == 0)
			{
				_x1 = _x3;
				_y1 = _y3;
				_x2 = _x4;
				_y2 = _y4;
				return true;
			}
			
			var prevX:Number = _cx;
			var prevY:Number = _cy;
			
			div = d1 / (d1 + d2);
			_cx = _x1 + (_x2 - _x1) * div;
			_cy = _y1 + (_y2 - _y1) * div;
			
			_offsetX = _cx - prevX;
			_offsetY = _cy - prevY;
			
			_localLocation = _g.target.globalToLocal(new Point(_cx, _cy), _localLocation);
			if(_angle1 == 0)
			{
				_angle1 = Math.atan2(_x1  - _cx, _y1 - _cy);
				_offsetX = _offsetY = 0;
			}		
			_angle2 = Math.atan2(_x3 - _cx, _y3 - _cy);
			var rotation:Number = _angle1 -  _angle2;			
			_angle1 = _angle2;
			
			if(_callBack.changed)		
			{
				_result.rotation = rotation;
				_result.localLocation = _localLocation;
				_result.dx = _offsetX;
				_result.dy = _offsetY;
				_callBack.changed(_result);
			}
			
			_x1 = _x3;
			_y1 = _y3;
			_x2 = _x4;
			_y2 = _y4;
			
			//返回true，说明这个连续的手势开始作用，当返回false的时候，说明这个连续的手势停止执行
			return _hasBegan;
		}
	}
}