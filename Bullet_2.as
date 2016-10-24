package {
	import flash.display.*;
	import flash.events.*;
	public class Bullet_2 extends MovieClip {
		public var speed:int;
		public var power:int;
		public function Bullet_2(x_, y_) {
			speed=20;
			power=2;
			x=x_;
			y=y_;
			addEventListener(Event.ENTER_FRAME, enterFrame);

		}

		function enterFrame(e:Event) {
			x=x+speed;

			if (x>Game.WIDTH+50) {
				killBullet();
				return;

			}

			for (var i:int=0; i<Enemy_1.list.length; i++) {
				if (this.hitTestObject(Enemy_1.list[i])) {
					if (Enemy_1.list[i].health<power) {
						power-=Enemy_1.list[i].health;
						Enemy_1.list[i].takeDamage(Enemy_1.list[i].health);
					} else {
						Enemy_1.list[i].takeDamage(power);
						killBullet();
					}
					return;
				}
			}
			for (i=0; i<Enemy_2.list.length; i++) {
				if (this.hitTestObject(Enemy_2.list[i])) {
					if (Enemy_2.list[i].health<power) {
						power-=Enemy_2.list[i].health;
						Enemy_2.list[i].takeDamage(Enemy_2.list[i].health);
					} else {
						Enemy_2.list[i].takeDamage(power);
						killBullet();
					}
					return;
				}
			}
			if (Game.main.boss&&this.hitTestObject(Game.main.boss)) {
				if (Game.main.boss.health<power) {
					power-=Game.main.boss.health;
					Game.main.score+=50*Game.main.boss.health;
					Game.main.boss.takeDamage(Game.main.boss.health , x + 100 , y);
				} else {
					Game.main.score+=50*power;
					Game.main.boss.takeDamage(power , x + 100 , y);
					killBullet();
				}

				return;
			}
		}

		//on kill, remove this bullet's ENTER_FRAME event, and remove its graphic from stage
		public function killBullet() {
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			parent.removeChild(this);
		}


	}

}