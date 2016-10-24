package
{
	import flash.display.*
	import flash.events.*
	import flash.ui.*
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	import flash.filters.*

	public class Enemy_2 extends MovieClip
	{
		//the list is an array that stores all enemy ships on the stage
		static public var list:Array = new Array();
		
		//each enemy ship will have an x and y velocity
		public var xv:Number;
		public var yv:Number;
		
		//each enemy ship will fire bullets at an interval
		public var shootTimer:int = 0;
		
		public var health:int=3; 
		
		//when an enemy ship instance is created
		public function Enemy_2()
		{
			//add it to the list of enemy ships
			list.push(this);
			
			//set it's x position to the right of the stage
			x = Game.WIDTH ;
			//give it a random y position
			y = Math.floor(Math.random()*(Game.HEIGHT-100));
			//give it a random x velocity
			xv = Math.floor(Math.random()*3+5);
						
			//add an ENTER_FRAME method to run some logic at frame rate
			addEventListener(Event.ENTER_FRAME, enterFrame);
			
			cacheAsBitmap = true;
			
			//add a drop shadow to the enemy ship for fun
			var filter:BitmapFilter = new DropShadowFilter(5,45,0x000000,50,5,5);
            			var myFilters:Array = new Array();
            			myFilters.push(filter);
            			filters = myFilters;
			
		}
		
		//do this at frame rate
		public function enterFrame(e:Event)
		{
			//move the enemy ship to the left
			x -= xv;
						
			//if it reaches the left edge of stage, kill it
			if(x < -150)
			{
				kill();
				return;
			}
			
			//see if this enemy ship is hitting the hero ship
			if(Game.main.ship && this.hitTestObject(Game.main.ship))
			{
				//if so kill this enemy ship
				health = 0;
				kill();
				Game.main.ship.takeDamage(1);
			}
						
			//each enemy ship will shoot at 1 second...
			shootTimer +=1;
			if (shootTimer > 40)
			{
				shootTimer = 0;
				var enemyb = new EnemyBullet_2(x - 50,y + 50);
				stage.addChild(enemyb);
			}
															
		}
		
		//when the enemy ship is killed
		public function kill()
		{
			if(health<=0){
				Game.main.score +=300;
				var explode = new Explode_2(x +25, y+ 25);
				stage.addChild(explode);
			}
			//remove the enemy ship's ENTE_FRAME event
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			//remove the grpahic from stage
			parent.removeChild(this);
			
			//find this enemy in the enemy ship list and remove it from the list
			for(var i:int = 0; i < list.length; i++)
			{
				if(list[i] == this)
					{
						list.splice(i,1);
					    break ;
					}
			}
		}
		
		//when this ship gets hit by a bullet from the hero ship
		public function takeDamage(damage)
		{
			//kill this ship
			health -= damage;
			if(health<=0){
			kill();
			}
			else{
			    var explode = new Explode_1(x , y + 25);
				stage.addChild(explode);
			}
						
		}
	}
}
