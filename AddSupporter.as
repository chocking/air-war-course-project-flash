package {
	import flash.display.*;
	import flash.events.*;

	public class AddSupporter extends MovieClip {
        
		public var speed:int;
		public var time:int=0;
        public var available:Boolean=false;
		
		public function AddSupporter() {

			speed=10;
			x = Game.WIDTH;
			y = Math.floor(Math.random()*(Game.HEIGHT-50));
			addEventListener(Event.ENTER_FRAME , enterFrame);

		}
		public function enterFrame(e:Event) {
			if(available == false){
			x -= speed;
			}
			if (Game.main.ship && this.hitTestObject(Game.main.ship)) {
				y = -100;
				available = true;
			}
			if(available==false && x<-50){
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				parent.removeChild(this);
			}
			if(available == true){
				  time ++;  
				if(time == 1)
				stage.addChild(new Supporter(0 , 175));
				if(time == 10){
					stage.addChild(new Supporter(0 , 125));
					stage.addChild(new Supporter(0 , 225));
				}
				if(time == 20){
					stage.addChild(new Supporter(0 , 75));
					stage.addChild(new Supporter(0 , 275));
				}
				if(time == 30){
					stage.addChild(new Supporter(0 , 25));
					stage.addChild(new Supporter(0 , 325));
				}
				if(time >30){
					parent.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, enterFrame);
				}
				
		   }
		}
	}

}