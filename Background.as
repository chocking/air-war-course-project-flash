package
{
	import flash.display.*
	import flash.events.*
	import flash.ui.*
	
	public class Background extends MovieClip
	{
		public function Background()
		{
			
			addEventListener(Event.ENTER_FRAME , onEnterFrame);
			
		}
		
		public function onEnterFrame(e:Event)
		{
		x -= 4;
		if(x <= -2000)
		x = 0;
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}