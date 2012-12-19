package acheGesture.utils
{
	/**
	 * All the keys for configuring of all the gestures
	 * 
	 * @author qidonghui
	 * 
	 */	
	public class GestureConfigKey
	{
		/**
		 * Max extended area size (pixel), used by Tap Gesture
		 * @see acheGesture.data.TapGesture
		 */		
		public static const MAX_DIST:String = "max_dist";
		
		/**
		 * Time threshold for recognizing hold gesture (long press gesture)
		 * @see acheGesture.data.HoldGesture
		 */		
		public static const TIME_THRESHOLD:String = "timeThreshold";
		
		/**
		 * Point mode for tap gesture
		 * Boolean type, to config if use the "point type mode" for the tap gesture
		 */		
		public static const POINT_MODE:String = "pointMode";
	}
}