package acheGesture.gestures
{
	import acheGesture.utils.GestureType;
	
	/**
	 * TO DO
	 * @author qidonghui
	 * 
	 */
	public class RotationGestureRecognizer extends GestureRecognizerPlugin
	{
		public function RotationGestureRecognizer(priority:int=0, requireGestureRecognizerToFail:Boolean=false)
		{
			super(GestureType.ROTATE, priority, requireGestureRecognizerToFail, true, 2);
		}
	}
}