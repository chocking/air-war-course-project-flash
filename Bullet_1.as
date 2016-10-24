
package {
	import flash.display.*;
	import flash.events.*;
	public class Bullet_1 extends MovieClip {
		//the speed at which the missile travels can be stored in a variable like this
		public var speed:int;

		//Remember, every movie clip can have an onLoad function which will fire once and only once
		//when it is loaded onto the stage
		public function Bullet_1(x_, y_) {

			//When a missile is loaded from the library to the stage, we can set it's speed.
			speed=20;

			//set the bullet position based on x and y values passed in (it needs to be created at the hero ship's position)
			x=x_;
			y=y_;

			//add an ENTER_FRAME event to control the bullet's logic at frame rate
			addEventListener(Event.ENTER_FRAME, enterFrame);

		}

		//Every movie clip can have an onEnterFrame function which will continuously fire at frame rate
		//which in this game is 30 frames a second. This is the best place to put code that checks for user input
		//and updates movie clip positions
		function enterFrame(e:Event) {
			//At frame rate, we want to update the missile's x position (in pixels), by moving it to the right
			//in this case 20 pixels, since our speed variable is set to 20.
			x=x+speed;

			//After we update its position, we use an IF statement to see if its _x position
			//is greater than 600 pixels (which means it has reached the far right end of the stage)
			if (x> Game.WIDTH + 50) {
				//If its _x position has indeed exceeded 600, remove the missile from the stage
				//removeEventListener(Event.ENTER_FRAME, enterFrame);
				//parent.removeChild(this);
				killBullet();

				return;

			}

			//iterate through the enemy ship list, and see if this bullet is hitting any enemies
			for (var i:int=0; i<Enemy_1.list.length; i++) {
				//if this bullet is hitting this enemy in the list
				if (this.hitTestObject(Enemy_1.list[i])) {
					//have the hit enemy take damage
					Enemy_1.list[i].takeDamage(1);

					//kill the bullet
					//removeEventListener(Event.ENTER_FRAME, enterFrame);
					//parent.removeChild(this);
					killBullet();
					return;
				}
			}
			for (i=0; i<Enemy_2.list.length; i++) {
				//if this bullet is hitting this enemy in the list
				if (this.hitTestObject(Enemy_2.list[i])) {
					//have the hit enemy take damage
					Enemy_2.list[i].takeDamage(1);

					//kill the bullet
					//removeEventListener(Event.ENTER_FRAME, enterFrame);
					//parent.removeChild(this);
					killBullet();
					return;
				}
			}
           if(Game.main.boss && this.hitTestObject(Game.main.boss)){   
			   Game.main.boss.takeDamage(1 , x , y);
			   Game.main.score +=50;
			   killBullet();
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