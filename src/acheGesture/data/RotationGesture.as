package acheGesture.data
{
	import acheGesture.utils.GestureType;

	/**
	 * Pinch Gesture Config Class
	 * 
	 * <listing version="3.0">
private function onPinchChange(e:AcheGestureEvent):void
{
var matrix:Matrix = _img.transformationMatrix;
matrix.translate(-_img.x - e.localLocation.x, -_img.y - e.localLocation.y);
matrix.rotate(e.rotation);
matrix.translate(_img.x + e.localLocation.x, _img.y + e.localLocation.y);
img.transformationMatrix = matrix;
}
</listing> 
	 * @author qidonghui
	 * 
	 */	
	public class RotationGesture extends Gesture
	{
		public function RotationGesture(began:Function, changed:Function, ended:Function = null)
		{
			super(GestureType.ROTATE);
			this.onBegan(began);
			this.onChanged(changed);
			this.onEnded(ended);
		}
	}
}