package {
	import flash.display.*;
	import flash.events.*;

	public class AddHeart extends MovieClip {

		public var speed:int;

		public function AddHeart() {

			speed=10;
			x = Game.WIDTH;
			y = Math.floor(Math.random()*(Game.HEIGHT-50));
			addEventListener(Event.ENTER_FRAME , enterFrame);

		}
		public function enterFrame(e:Event) {
			x -= speed;
			if (Game.main.ship && this.hitTestObject(Game.main.ship)) {
				if (Game.main.ship.health<5) {
					Game.main.ship.health++;
				}
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				parent.removeChild(this);
			}
			if(x <-50){
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				parent.removeChild(this);
			}
		}
	}

}