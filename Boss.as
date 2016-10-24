package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.filters.*;

	public class Boss extends MovieClip {

		var speed:int=4;
		public var health:int=150;
		public var time:int=0;

		public function Boss() {
			x=700;
			y=100;
			addEventListener(Event.ENTER_FRAME , enterFrame);

			var filter:BitmapFilter=new DropShadowFilter(5,45,0x000000,50,5,5);
			var myFilters:Array = new Array();
			myFilters.push(filter);
			filters=myFilters;
		}
		public function enterFrame(e:Event) {
			time++;
			if (time<=90) {//boss出现
				x-=3;
			} else if (time == 91) {//action_1 发射飞弹
				stage.addChild(new BossMissile_1(700 , 0));
				stage.addChild(new BossMissile_1(700 , 370));

			} else if (time == 101) {//action_1 发射飞弹
				stage.addChild(new BossMissile_1(700 , 30));
				stage.addChild(new BossMissile_1(700 , 340));
			} else if (time == 111) {//action_1 发射飞弹
				stage.addChild(new BossMissile_1(700 , 60));
				stage.addChild(new BossMissile_1(700 , 310));
			} else if (time>120 && time<=150) {//boss向上移动
				y-=2;
			} else if (time>180 && time<=210) {//boss向左冲击
				x-=11;
			} else if (time>240 && time<=270) {//boss后退到右下角
				x+=11;
				y+=4;
				if (y==60||y==80||y==100||y==120||y==140||y==160) {//action_2 发射飞弹
					stage.addChild(new BossMissile_1(x , y + 50));
				}
			} else if (time==300||time==310||time==320) {
                    stage.addChild(new BossMissile_2( 700 , y+150));
			} else if (time>330 && time<=360) {//boss回到原位置
				y-=2;
				if (time>=360) {
					time=90;
				}
			}
			
			if(Game.main.ship && this.hitTestObject(Game.main.ship))
			{
				Game.main.ship.takeDamage(2);
			}
		}
		public function takeDamage(damage , x_ , y_) {
			health-=damage;
			if (health<=0) {
				kill();
			} else {
				if (x_<x+150) {
					x_+=50;
				}
				var explode=new Explode_1(x_-25,y_+25);
				stage.addChild(explode);

			}
		}
		public function kill() {
			Game.main.score+=2000;

			stage.addChild(new Explode_2(x , y));
			stage.addChild(new Explode_2(x + 100 , y + 20));
			stage.addChild(new Explode_2(x + 30, y + 40));
			stage.addChild(new Explode_2(x , y + 90));
			stage.addChild(new Explode_2(x + 150 , y + 120));
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			parent.removeChild(this);
			Game.main.ship.invincible=true;
			Game.main.stage.addChild(new Invincible(Game.main.ship.x , Game.main.ship.y));
			Game.main.boss=null;
			Game.main.gameStart=false;
			if(Game.main.flag == false){
			Game.main.stage.addChild(new RestartButton( 280 , 300 ));
			Game.main.stage.addChild(new Win(100 , 100));
			}
		}
	}

}