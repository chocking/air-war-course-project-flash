package 
{
	import flash.display.*;
	import flash.events.*;

	public class EnemyBullet_1 extends Sprite {
		
		//enemy bullets need a speed
		public var speed:int;

		public function EnemyBullet_1(x_, y_) 
		{
			
			//the enemy bullets will be a little slower then the hero bullets
			speed = 15;
			//plot them based on the x and y vlues passed in (the position of the alien ship)
			x = x_;
			y = y_;
			
			//raw the bullet, starting with a thick black line
			graphics.lineStyle(6,0x000000,1);
			graphics.moveTo(-4,0);
			graphics.lineTo(4,0);
			//then make a thinner red line, the enemy bullets will be red
			graphics.lineStyle(2,0xff0000,1);
			graphics.moveTo(-3,0);
			graphics.lineTo(3,0);

			//add an ENTER_FRAME event to perform  logic at frame rate
			addEventListener(Event.ENTER_FRAME, enterFrame);
			//this improves perfromance of vector graphics
			cacheAsBitmap = true;
		}
		
		//this logic will run at frame rate
		public function enterFrame(e:Event) 
		{
			//update the position, move the bullet to the left 
			x -= speed;
			
			if(Game.main.ship && this.hitTestObject(Game.main.ship))
			{
				kill();
				Game.main.ship.takeDamage(1);
				return ;
			}
			//if the bullet reaches the left edge of screen
			if (x < 0) 
			{
				//kill it
				kill();
				return;
			}
			
		}
		
		//on kill, remove this bullet's ENTER_FRAME event, and remove its graphic from stage
		public function kill() 
		{
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			parent.removeChild(this);
		}
	}
}