package acheGesture.data
{
	import acheGesture.utils.GestureType;

	public class SwipeGesture extends Gesture
	{
		public function SwipeGesture(recognized:Function)
		{
			super(GestureType.SWIPE);
			this.recognized = recognized;
		}
	}
}