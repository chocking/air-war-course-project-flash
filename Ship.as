package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.filters.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;

	public class Ship extends MovieClip {
		static public var main;
		public var v:Number;
		public var myFilters:Array;
		public var shootTimer_1:int=0;//子弹_1发射冷却值(8frame)
		public var shootTimer_2:int=0;//子弹_2发射冷却值(15frame)
		public var bulletKind:int=1;//子弹类型，默认为子弹_1
		public var bulletTime_2:int=0;//子弹_2限时器（30s）
		public var health:int=5;//生命值
		static public var healthList:Array = new Array();//存放生命值
		public var initHealth:Boolean=false;//记录生命值是否初始化
		public var invincible:Boolean=false;
        
		var spaceLocked:Boolean=false;
		var leftIsPressed:Boolean=false;
		var rightIsPressed:Boolean=false;
		var upIsPressed:Boolean=false;
		var downIsPressed:Boolean=false;
		public function Ship(x_, y_) {

			main=this;
			v=10;
			x=x_;
			y=y_;
			
			addEventListener(Event.ENTER_FRAME,enterFrame);

			for (var i:int = 0; i < health; i++) {
				healthList.push(new Heart());
			}

			cacheAsBitmap=true;//优化

			var filter:BitmapFilter=new DropShadowFilter(5,45,0x000000,50,5,5);
			myFilters = new Array();
			myFilters.push(filter);
			filters=myFilters;

		}
		public function showHealth() {
			if (initHealth==false) {
				for (var i:int = 0; i < health; i++) {
					stage.addChild(healthList[i]);
					healthList[i].x = 30+(40*i);
					healthList[i].y=10;
				}
				initHealth=true;
			}
			for (i = 0; i < 5; i++) {
				if (i<health) {
					healthList[i].visible=true;
				} else {
					healthList[i].visible=false;
				}
			}

		}

		public function enterFrame(e:Event) {
			showHealth();
			if(bulletKind==1 && shootTimer_1<8) {
				shootTimer_1++;
			}
			if(bulletKind==2 ){
				bulletTime_2 ++;
				if(bulletTime_2 > 450)
				bulletKind = 1;
				if(shootTimer_2<15)
				shootTimer_2++;
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);

			if (downIsPressed&&y<=350) {
				y+=v;
			}
			if (rightIsPressed&&x<=650) {
				x+=v;
			}
			if (leftIsPressed&&x>=0) {
				x-=v;
			}
			if (upIsPressed&&y>=0) {
				y-=v;
			}
			if (spaceLocked==true) {
				if(bulletKind==1 && shootTimer_1>=8){
				var b=new Bullet_1(x+25,y+25);
				stage.addChild(b);
				shootTimer_1=0;
				}
				if(bulletKind==2 && shootTimer_2>=15){
					stage.addChild(new Bullet_2(x+25 , y+10));
					stage.addChild(new Bullet_2(x+25 , y+35));
					
					shootTimer_2=0;
				}
			}
			
		}
		public function keyDownHandler(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case Keyboard.LEFT :
					leftIsPressed=true;
					break;
				case Keyboard.RIGHT :
					rightIsPressed=true;
					break;
				case Keyboard.UP :
					upIsPressed=true;
					break;
				case Keyboard.DOWN :
					downIsPressed=true;
					break;
				case Keyboard.SPACE :

					spaceLocked=true;
					break;



			}
		}

		public function keyUpHandler(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case Keyboard.LEFT :
					leftIsPressed=false;
					break;
				case Keyboard.RIGHT :
					rightIsPressed=false;
					break;
				case Keyboard.UP :
					upIsPressed=false;
					break;
				case Keyboard.DOWN :
					downIsPressed=false;
					break;
				case Keyboard.SPACE :
					spaceLocked=false;
					break;
			}
		}
		public function takeDamage(damage:int) {
			if (! invincible) {
				health-=damage;
				if (health<=0) {
					health=0;
					kill();
				} else {
					var explode=new Explode_1(x,y);
					stage.addChild(explode);
					invincible = true;
					stage.addChild(new Invincible( x , y));
				}
				showHealth();
			}
		}
		public function kill() {
			var explode=new Explode_2(x,y);
			stage.addChild(explode);
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			parent.removeChild(this);
			Game.main.ship=null;
			Game.main.gameStart=false;
			if(Game.main.flag==false){
			Game.main.stage.addChild(new RestartButton( 280 , 200 ));
			Game.main.stage.addChild(new HelpButton(280 , 250));
			}
		}
	}
}