package acheGesture.core
{
	/**
	 * @private
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class PropGesture
	{
		/**
		 * 目标手势，GesturePlugin 
		 */		
		public var t:Object;
		
		/**
		 * Continuous Gesture，是否需要在确认手势之后不停得更新数据 
		 */		
		public var c:Boolean;
		
		/**
		 *  execute gestur recognized callback function name
		 */		
		public var p0:String;
		
		/**
		 *  check gesture function name
		 */		
		public var p1:String;
		
		/**
		 * update value function name 
		 */		
		public var p2:String;
		
		/**
		 * 手势需要的触摸数量，对应numTouchesRequired 
		 */		
		public var n:int;
		
		public var _next:PropGesture;
		
		public var _prev:PropGesture;
		
		
		/**
		 * Possible，还有可能被识别 
		 */		
		public var p:Boolean = true;
		
		/**
		 * recognized
		 * 是否已经识别出此手势，如果识别出来，计算链条将被打破，识别出来的手势会放到首位
		 */		
		public var r:Boolean;
		
		/**
		 * failed
		 * 一轮手势检测中已经确认监测失败 
		 */		
		public var f:Boolean;
		
		/**
		 * 是否在hold链条里面等待被执行（requireGestureRecognizerToFail确定识别失败），或者被取消执行 （requireGestureRecognizerToFail确定已经识别）
		 */		
		public var h:Boolean;
		
		/** Priority **/
		public var pr:int;
		
		/**
		 * requireGestureRecognizerToFail的源，
		 * 也就是这个手势g，需要当前手势再f=true的时候再次尝试
		 */		
		public var _o:PropGesture;
		
		/**
		 * requireGestureRecognizerToFail
		 * 如果_f != null，说明此手势需要等待_f在识别失败的时候才开始识别 
		 */		
		public var _f:PropGesture;
		
		public function PropGesture(target:Object, property0:String = "executeGesturRecognizedCallback", property1:String = "checkGesture", property2:String = "updateValue",
			next:PropGesture=null, isContinuous:Boolean = false, priority:int=0, numTouchesRequired:int = 1)
		{
			this.t = target;
			this.c = isContinuous;
			if (next) {
				next._prev = this;
				this._next = next;
			}
			this.p0 = property0;
			this.p1 = property1;
			this.p2 = property2;
			this.n = numTouchesRequired;
		}
		
	}
}