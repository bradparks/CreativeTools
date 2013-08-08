package com.creative.image.bitmap
{
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class BitmapClipPlayer
	{
		private static var t:Timer;
		private static var bitmapClipArray:Vector.<BitmapClip>;
		
		public static function init():void
		{
			bitmapClipArray = new Vector.<BitmapClip>();
			
			t = new Timer(33);
			t.addEventListener(TimerEvent.TIMER, go);
		}
		
		public static function registerClip(clip:BitmapClip):void
		{
			if (!bitmapClipArray)
				bitmapClipArray = new Vector.<BitmapClip>();
			
			bitmapClipArray.push(clip);
		}
		
		public static function stop():void
		{
			t.stop();
		}
		
		public static function play():void
		{
			t.start();
		}
		
		// EVENT HANDLERS
		protected static function go(event:TimerEvent):void
		{
			for (var i:int = 0; i < bitmapClipArray.length; i++) 
			{
				if (bitmapClipArray[i].paused)
					continue;
				bitmapClipArray[i].nextFrame();
			}
				
			
		}
		// SETTERS AND GETTERS
		public static function get playbackSpeed():int
		{
			return t.delay;
		}

		public static function set playbackSpeed(value:int):void
		{
			t.delay = value;
		}

	}
}