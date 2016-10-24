package{
	import flash.display.*;
	import flash.events.*;
	
	public class BossMissile_2 extends MovieClip{
	   public var speed:int = 20;
	   
	 public function BossMissile_2(x_ , y_ ){ 
	     x = x_;
		 y = y_;
	    addEventListener(Event.ENTER_FRAME , enterFrame);
	 }
	
	   public function enterFrame(e:Event){
		     x -= speed ; 
		 if(Game.main.ship && this.hitTestObject(Game.main.ship))
			{
				kill();
				Game.main.ship.takeDamage(2);
				return ;
			}
			if (x < -250) {
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