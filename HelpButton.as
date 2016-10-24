package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;

	public class HelpButton extends SimpleButton {
		public var help=new Help(420,220);

		public function HelpButton(x_ , y_) {
			x=x_;
			y=y_;
			addEventListener(Event.ENTER_FRAME , enterFrame);
			addEventListener(MouseEvent.CLICK, showHelp);
		}
        
		public function enterFrame(e:Event){
			if (Game.main.gameStart==true) {
				if (Game.main.showHelp==true) {
					Game.main.stage.removeChild(help);
				}
				removeEventListener(Event.ENTER_FRAME , enterFrame);
				removeEventListener(MouseEvent.CLICK, showHelp);
				parent.removeChild(this);

			}
			
		}

		public function showHelp(e:MouseEvent) {
			
			if (Game.main.showHelp==false) {
				Game.main.showHelp=true;
				Game.main.stage.addChild(help);
			} else {
				Game.main.showHelp=false;
				Game.main.stage.removeChild(help);
			}

		}

	}
}