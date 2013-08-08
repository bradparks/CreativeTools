package com.creative.screen
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Screen extends Sprite
	{
		private var screenListenerArray:Vector.<ScreenListenerObject>;
		public var managerRef:ScreenManager;
		
		public function Screen():void
		{
			screenListenerArray = new Vector.<ScreenListenerObject>();
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init)
			
		}
		
		protected function goToScreen(screenID:uint):void
		{
			managerRef.setScreen(screenID);
		}
		
		
		private function init(e:Event = null):void
		{
			if (e) removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
			addScreenEventListener(stage, Event.RESIZE, resize);
			
		}
		
		
		private function onRemoved(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
			for (var i:int = 0; i < screenListenerArray.length; i++) 
			{
				var o:Object = screenListenerArray[i].object;
				var t:String = screenListenerArray[i].type;
				var l:Function = screenListenerArray[i].listener;
				o.removeEventListener(t, l);
			}
			
			screenListenerArray = null;
			
		}
		
		public function deactivate():void
		{
			for (var i:int = 0; i < screenListenerArray.length; i++) 
			{
				var o:Object = screenListenerArray[i].object;
				var t:String = screenListenerArray[i].type;
				var l:Function = screenListenerArray[i].listener;
				o.removeEventListener(t, l);
			}
		}
		
		public function reactivate():void
		{
			for (var i:int = 0; i < screenListenerArray.length; i++) 
			{
				var o:Object = screenListenerArray[i].object;
				var t:String = screenListenerArray[i].type;
				var l:Function = screenListenerArray[i].listener;
				o.addEventListener(t, l);
			}
		}
		
		public function resize(e:Event = null):void
		{
			throw new Error("This method needs to be overridden");
		}
		
		protected function addScreenEventListener(object:Object, type:String, listener:Function):void
		{
			object.addEventListener(type, listener);
			
			var screenListenerObject:ScreenListenerObject = new ScreenListenerObject();
			screenListenerObject.object = object;
			screenListenerObject.type = type;
			screenListenerObject.listener = listener;
			
			screenListenerArray.push(screenListenerObject);
			
		}
	}
}