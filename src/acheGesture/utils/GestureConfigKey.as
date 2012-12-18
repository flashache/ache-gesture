package acheGesture.utils
{
	/**
	 * All the keys for config of all the gestures
	 * 
	 * @author qidonghui
	 * 
	 */	
	public class GestureConfigKey
	{
		/**
		 * 最大扩展区域，Tap手势使用到 
		 */		
		public static const MAX_DIST:String = "max_dist";
		
		/**
		 * 时间间隔，Hold手势使用到
		 */		
		public static const TIME_THRESHOLD:String = "timeThreshold";
		
		/**
		 * 单点的Tap操作，Tap手势使用到， 
		 * 布尔类型，确认是否是单点的“轻击”
		 */		
		public static const POINT_MODE:String = "pointMode";
	}
}