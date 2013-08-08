package screens
{
	import com.creative.screen.Screen;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Screen1 extends Screen
	{
		public function Screen1():void
		{
			super();
			
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0);
			s.graphics.drawRect(0, 0, 50, 50);
			s.graphics.endFill();
			addChild(s);
			
			addScreenEventListener(s, MouseEvent.CLICK, onClicked);
		}
		
		private function onClicked(e:Event):void
		{
			
			managerRef.setScreen(1);
		}
		
		override public function resize(e:Event=null):void
		{
			
		}
	}
}