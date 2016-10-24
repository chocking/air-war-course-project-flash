package {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.net.URLRequest;

	public class Game extends MovieClip {

		static public var main;

		static public var WIDTH:int=700;
		static public var HEIGHT:int=400;
		public var enemyTimer_1:int=0;
		public var enemyTimer_2:int=0;
		public var enemyTimeInterval_1:int=60;
		public var enemyTimeInterval_2:int=120;
		public var ship=null;
		public var gameStart:Boolean=false;
		public var time:int=0;//帧数计时器,900帧（30s）置0
		public var bossT:int=120;//游戏boss出现时间倒数
		public var score:int=0;
		public var boss=null;
		public var rank:int=1;//随时间游戏难度等级加大
		public var showHelp:Boolean=false;//是否已经显示帮助文档
        public var flag:Boolean = false;
		 
		public function Game() {

			main=this;
			//ship = new Ship(WIDTH/2,HEIGHT/2);
			//stage.addChild(ship);
			//addEventListener(MouseEvent.CLICK , initGame);
			stage.addChild(new StartButton(280 , 200));
			stage.addChild(new HelpButton(280 , 250));
			addEventListener(Event.ENTER_FRAME, enterFrame);
			bossTime.text=""+bossT;
			
		}
		public function enterFrame(e:Event) {
			if (gameStart==true) {
				time++;
				enemyTimer_1+=1;
				enemyTimer_2+=1;
			}
			if (time%30==0&&time!=0) {
				if (bossT>0) {
					bossT--;
					bossTime.text=""+bossT;
				} else {

					bossTime.text="Fight!!";
				}
				if (bossT==0&&! boss&&gameStart==true) {
					boss = new Boss();
					stage.addChild(boss);
				}

			}
			if (gameStart==true && (time==450||time==750) ) {

				stage.addChild(new Star());
			}
			if (time==300||time==600) {
				var addHeart = new AddHeart();
				stage.addChild(addHeart);
			}
			if (time==700) {
				stage.addChild(new AddBullet_2());

			}
			if (time==900) {
				stage.addChild(new AddSupporter());
				if (rank<5) {
					rank++;
				}
				if (rank<5) {
					enemyTimeInterval_1=60-rank*10;
					enemyTimeInterval_2=120-rank*10;
				} else {
					enemyTimeInterval_1=60;
					enemyTimeInterval_2=120;
				}
				time=0;
			}
			Score.text="score : "+score;
			if (enemyTimer_1>enemyTimeInterval_1) {

				enemyTimer_1=0;
				var enemy_1 = new Enemy_1();
				stage.addChild(enemy_1);
			}
			if (enemyTimer_2>enemyTimeInterval_1) {

				enemyTimer_2=0;
				var enemy_2 = new Enemy_2();
				stage.addChild(enemy_2);
			}

			
		}
		public function initGame() {
            if(ship){
				flag = true;
				ship.kill();
				flag = false;
			}
			ship=new Ship(50,HEIGHT/2-25);
			stage.addChild(ship);
			ship.invincible=true;
			stage.addChild(new Invincible( x , y));
			if (boss) {
				flag = true;
				boss.kill();
				flag = false;
			}
			gameStart=true;
			time=0;
			bossT=120;
			enemyTimer_1=0;
			enemyTimer_2=0;
			score=0;
			rank=1;
			enemyTimeInterval_1=60;
			enemyTimeInterval_2=120;
		}

	}
}