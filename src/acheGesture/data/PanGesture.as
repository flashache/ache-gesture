package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Pan(drag) Gesture Config Class
	 *  
	 * @author qidonghui
	 * 
	 */	
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