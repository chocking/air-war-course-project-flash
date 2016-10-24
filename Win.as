package{
	import flash.display.*;
	import flash.events.*;
	
	public class Win extends MovieClip{
		public var time:int = 0;
		
		public function Win(x_ , y_){
			x = x_;
			y = y_;
			
			addEventListener(Event.ENTER_FRAME , enterFrame);
		}
		
		public function enterFrame(e : Event){
			time ++;
			if(time < 15){
			   y --;
			}
			else if(time<22){
				y += 2 ;
			}
			else{
				time=0;
			}
			if(Game.main.gameStart == true){
				removeEventListener(Event.ENTER_FRAME , enterFrame );
				parent.removeChild(this);
			}
		}
	
	}
}