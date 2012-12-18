package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Hold(Long press) Gesture Config Class
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class HoldGesture extends Gesture
	{
		public function HoldGesture(recognized:Function)
		{
			super(GestureType.HOLD);
			this.onRecognized(recognized);
		}
		
	}
}