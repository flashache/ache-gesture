package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Tap Gesture Config Class
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class TapGesture extends Gesture
	{
		public function TapGesture(recognized:Function, possible:Function = null)
		{
			super(GestureType.TAP);
			this.onRecognized(recognized);
			this.onPossible(possible);
		}
	}
}