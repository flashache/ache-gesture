package acheGesture.utils
{
	/**
	 * 所有的手势（分为“连续”和“离散”手势）可能的状态 
	 * @author qidonghui
	 * 
	 */	
	public class GestureState
	{
		public static const POSSIBLE:String = "possible";
		
		public static const RECOGNIZED:String = "recognized";
		
		public static const FAILED:String = "failed";
		
		public static const BEGAN:String = "began";
		
		public static const CHANGED:String = "changed";
		
		public static const ENDED:String = "ended";
		
		public static const CANCELLED:String = "cancelled";
		
		public function GestureState()
		{
		}
	}
}