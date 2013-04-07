package acheGesture.gestures
{
	import acheGesture.GestureManager;
	import acheGesture.utils.GestureConfigKey;
	import acheGesture.utils.GestureType;
	
	import flash.geom.Rectangle;
	
	import starling.events.Touch;
	import starling.events.TouchPhase;

	/**
	 * @private
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class TapGestureRecognizer extends GestureRecognizerPlugin
	{
		/**
		 * 鼠标的有效区域，默认在对象延展出来的80像素之内都属于有效 
		 * 可在config设置
		 */
		private var _max_drag_dist:uint = 80;
		
		private var _pointMode:Boolean = false;
		
		public function TapGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean=false)
		{
			super(GestureType.TAP, priority, requireGestureRecognizerToFail);
		}
		
		override public function _onInitGesture(callback:Object, config:Object, g:GestureManager):Boolean
		{
			if(config != null && config[GestureConfigKey.MAX_DIST] != null) _max_drag_dist = uint(config[GestureConfigKey.MAX_DIST]);
			if(config != null && config[GestureConfigKey.POINT_MODE] != null) _pointMode = config[GestureConfigKey.POINT_MODE];
			return super._onInitGesture(callback, config, g);
		}
		
		override public function checkGesture(ts:Vector.<Touch>):Boolean
		{
			var t:Touch = ts[0];
			if(t == null)  return false;
			var validate:Boolean;
			if(t.phase == TouchPhase.BEGAN)
			{
				gesturePossible(true);
				_failed = false;
			}
			if(t.phase == TouchPhase.MOVED) 
			{
				if(_pointMode)
				{
					//对于单点模式的点击，一旦手指移动，则认为识别失败
					_failed = true;
					if(_possible) gesturePossible(false);
				}else{
					var rec:Rectangle = _g.target.getBounds(_g.target.stage);
					if(t.globalX < rec.x - _max_drag_dist ||
						t.globalY < rec.y - _max_drag_dist ||
						t.globalX > rec.x + rec.width + _max_drag_dist ||
						t.globalY > rec.y + rec.height + _max_drag_dist)
					{
						//在识别有效区域
						gesturePossible(false);
					}else{
						//在识别有效区域之外
						gesturePossible(true);
					}
				}
				
			}
			if(t.phase == TouchPhase.ENDED)
			{
				validate = _possible;				
				_failed = false;
			}
			return validate;
		}
		
	}
}