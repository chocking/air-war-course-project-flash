package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	public class StartButton extends SimpleButton {

		public function StartButton(x_ , y_) {
			x=x_;
			y=y_;
			addEventListener(MouseEvent.CLICK, initGame);
			Game.main.stage.addChild(new Name(110 , 70));
		}
		
		
		public function initGame(e:MouseEvent) {
			removeEventListener(MouseEvent.CLICK, initGame);
			parent.removeChild(this);
			Game.main.initGame();
			Game.main.stage.focus=stage;
			
		}

	}
}