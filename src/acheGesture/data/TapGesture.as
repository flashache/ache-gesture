package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Tap Gesture Config Class
	 * @example
	 * <listing version="3.0">
	 * private function linkGesture():void
	 * {
	 *  var g1:Gesture = new TapGesture(onTapRecognized, onTapPossible);
	 *  GestureManager.add(_btn, new GestureVars().onTap(g1).vars);
	 * }
	 * 
	 * private function onTapRecognized(e:AcheGestureEvent):void
	 * {
	 * 	trace("tap gesture recognized!");
	 * 	_btn_up.visible = true;
	 * 	_btn_down.visible = false;
	 * }
	 * 
	 * private function onTapPossible(e:AcheGestureEvent):void
	 * {
	 * 	trace("tap gesture onTapPossible >>>" + e.possible);
	 * 	var value:Boolean = e.possible;
	 * 	_btn_up.visible = !value;
	 * 	_btn_down.visible = value;
	 * }
	 * </listing>
	 * 
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