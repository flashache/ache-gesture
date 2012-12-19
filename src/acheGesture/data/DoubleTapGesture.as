package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Double tap gesture gonfig class
	 *  
	 * @author qidonghui
	 * 
	 */	
	public class DoubleTapGesture extends Gesture
	{
		/**
		 * Constroctor function<br/>
		 * For double tap only have two state for call back, which is recognized and failed<br/>
		 * <b>call back function should receive one and only one parameter use AcheGestureEvent as data type</b>
		 * 
		 * @see acheGesture.utils.GestureState
		 * @see acheGesture.events.AcheGestureEvent
		 *  
		 * @param recognized	callback function to run when this gesture recognized.
		 * @param failed		callback function to run when this gesture recognize failed.
		 * 
		 */		
		public function DoubleTapGesture(recognized:Function, failed:Function = null)
		{
			super(GestureType.DOUBLE_TAP);
			this.onRecognized(recognized);
			this.onFailed(failed);
		}
	}
}