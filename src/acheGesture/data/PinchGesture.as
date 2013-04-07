package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Pinch Gesture Config Class
	 * <listing version="3.0">
private function onPinchChange(e:AcheGestureEvent):void
{
var matrix:Matrix = _img.transformationMatrix;
matrix.translate(-_img.x - e.localLocation.x, -_img.y - e.localLocation.y);
matrix.scale(e.dScale, e.dScale);
matrix.translate(_img.x + e.localLocation.x, _img.y + e.localLocation.y);
img.transformationMatrix = matrix;
}
</listing>
	 * @author qidonghui
	 * 
	 */	
	public class PinchGesture extends Gesture
	{
		public function PinchGesture(changed:Function)
		{
			super(GestureType.PINCH);
			this.onChanged(changed);
		}
	}
}