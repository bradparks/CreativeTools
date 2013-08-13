package com.creative.screen
{
	import flash.display.Sprite;
	
	public class AScreen extends Sprite
	{
		private var screenListenerArray:Vector.<ScreenListenerObject>;
		
		public var managerRef:ScreenManager;
		
		public var screenWidth:int;
		public var screenHeight:int;
		
		public function AScreen():void
		{
			screenListenerArray = new Vector.<ScreenListenerObject>();
			
		}
		
		protected function goToScreen(screenID:uint, useHistory:Boolean = true):void
		{
			managerRef.gotoScreen(screenID, useHistory);
		}
		
		protected function goBack():void
		{
			managerRef.goBack();
		}
		
		
		public function init():void
		{
						
			
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
		
		public function resize():void
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