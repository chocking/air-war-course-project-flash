package {
	import flash.display.*;
	import flash.events.*;

	public class Star extends MovieClip {
		public var award:int=400;
		public var speed:int;

		public function Star() {
			speed=10;
			x=Game.WIDTH+50;
			y = Math.floor(Math.random()*(Game.HEIGHT-50));
			addEventListener(Event.ENTER_FRAME , enterFrame);

		}
		public function enterFrame(e:Event) {
			x-=speed;
			if (Game.main.ship&&this.hitTestObject(Game.main.ship)) {
				Game.main.score+=award;
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				parent.removeChild(this);

			}
		}


	}

}