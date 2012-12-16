package acheGesture.data
{
	import acheGesture.utils.GestureType;

	public class PinchGesture extends Gesture
	{
		public function PinchGesture(changed:Function)
		{
			super(GestureType.PINCH);
			this.onChanged(changed);
		}
	}
}