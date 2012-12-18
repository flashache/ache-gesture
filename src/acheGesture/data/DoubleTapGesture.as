package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Double Tap Gesture Config Class
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class DoubleTapGesture extends Gesture
	{
		public function DoubleTapGesture(recognized:Function, failed:Function = null)
		{
			super(GestureType.DOUBLE_TAP);
			this.onRecognized(recognized);
			this.onFailed(failed);
		}
	}
}