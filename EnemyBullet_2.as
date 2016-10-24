package {
	import flash.display.*;
	import flash.events.*;

	public class EnemyBullet_2 extends Sprite {

		public var speed:int;

		public function EnemyBullet_2(x_, y_) {

			speed=15;
			x=x_;
			y=y_;

			addEventListener(Event.ENTER_FRAME, enterFrame);

		}

		function enterFrame(e:Event) {

			x-=speed;
            if(Game.main.ship && this.hitTestObject(Game.main.ship))
			{
				kill();
				Game.main.ship.takeDamage(1);
				return ;
			}
			if (x < -50) {
				kill();
				return;
			}



		}

		public function kill() {
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			parent.removeChild(this);
		}


	}

}