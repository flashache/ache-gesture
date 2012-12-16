package acheGesture.data
{
	import acheGesture.utils.GestureType;

	public class ScrollGesture extends Gesture
	{
		public function ScrollGesture(began:Function, changed:Function)
		{
			super(GestureType.SCROLL);		
			this.changed(changed);
			this.began(began);
		}
	}
}