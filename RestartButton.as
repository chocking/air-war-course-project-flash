package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	public class RestartButton extends SimpleButton {

		public function RestartButton(x_ , y_) {
			x=x_;
			y=y_;
			addEventListener(MouseEvent.CLICK, initGame);
		}
		
		
		public function initGame(e:MouseEvent) {
			removeEventListener(MouseEvent.CLICK, initGame);
			parent.removeChild(this);
			Game.main.initGame();
			Game.main.stage.focus=stage;
			
		}

	}
}