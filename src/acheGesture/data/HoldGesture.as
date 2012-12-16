package acheGesture.data
{
	import acheGesture.utils.GestureType;

	public class HoldGesture extends Gesture
	{
		public function HoldGesture(recognized:Function)
		{
			super(GestureType.HOLD);
			this.onRecognized(recognized);
		}
		
	}
}