package {
	import flash.display.*;
	import flash.events.*;

	public class Explode_1 extends MovieClip{
	        public var time:int=0;
	  
		public function Explode_1(x_ , y_) {
			x=x_;
			y=y_;
			addEventListener(Event.ENTER_FRAME , enterFrame);
		}

		public function enterFrame(e:Event) {
			
			time ++ ;
			if (time >= 10) {
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				parent.removeChild(this);
				return ;
			}
		}

	}
}