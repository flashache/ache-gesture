package acheGesture.data
{
	import acheGesture.utils.GestureType;

	public class PanGesture extends Gesture
	{
		public function PanGesture(began:Function, changed:Function, ended:Function = null)
		{
			super(GestureType.PAN);
			this.onBegan(began);
			this.onChanged(changed);
			this.onEnded(ended);
		}
	}
}