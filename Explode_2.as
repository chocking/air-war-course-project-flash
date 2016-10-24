package {
	import flash.display.*;
	import flash.events.*;

	public class Explode_2 extends MovieClip{
		var time:int=0;
		public function Explode_2 (x_ , y_) {
			x=x_;
			y=y_;
			addEventListener(Event.ENTER_FRAME , enterFrame);
		}

		public function enterFrame(e:Event) {
			if (time==0) {
				stage.addChild(this);
			}
			time++;
			if (time>=15) {
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				parent.removeChild(this);
			}
		}

	}
}