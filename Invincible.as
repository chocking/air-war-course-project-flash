package {
	import flash.display.*;
	import flash.events.*;

	public class Invincible extends MovieClip {
		public var time:int=0;

		public function Invincible(x_ , y_) {

			x=x_;
			y=y_;
			addEventListener(Event.ENTER_FRAME , enterFrame);

		}
		public function enterFrame(e : Event) {
			x = Game.main.ship.x;
			y = Game.main.ship.y;
			time++;
			if (time==11) {
				this.visible=false;
			} else if (time == 21) {
				this.visible=true;
			} else if (time == 31) {
				this.visible=false;
			} else if (time == 41) {
				this.visible=true;
			} else if (time == 51) {
				this.visible=false;
			}

			if (time>=60) {
				removeEventListener(Event.ENTER_FRAME , enterFrame);
				parent.removeChild(this);
				Game.main.ship.invincible = false;
			}
		}

	}

}