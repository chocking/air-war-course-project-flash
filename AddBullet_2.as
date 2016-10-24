package {
	import flash.display.*;
	import flash.events.*;

	public class AddBullet_2 extends MovieClip {

		public var speed:int;

		public function AddBullet_2() {

			speed=10;
			x=Game.WIDTH;
			y = Math.floor(Math.random()*(Game.HEIGHT-50));
			addEventListener(Event.ENTER_FRAME , enterFrame);

		}
		public function enterFrame(e:Event) {
			x-=speed;
			if (Game.main.ship&&this.hitTestObject(Game.main.ship)) {
				Game.main.ship.bulletKind=2;
				Game.main.ship.bulletTime_2=0;
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