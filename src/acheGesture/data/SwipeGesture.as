package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Swipe Gesture Config Class
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class SwipeGesture extends Gesture
	{
		public function SwipeGesture(recognized:Function)
		{
			super(GestureType.SWIPE);
			this.recognized = recognized;
		}
	}
}