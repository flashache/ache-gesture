package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Pinch Gesture Config Class
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class PinchGesture extends Gesture
	{
		public function PinchGesture(changed:Function)
		{
			super(GestureType.PINCH);
			this.onChanged(changed);
		}
	}
}