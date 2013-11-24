package com.creative.image.bitmap
{
	
	import com.creative.image.bitmap.events.BitmapClipEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class BitmapClipPlayer
	{
		private static var t:Timer;
		private static var bitmapClipArray:Vector.<BitmapClip> = new Vector.<BitmapClip>();
		private static var activeClipArray:Vector.<BitmapClip> = new Vector.<BitmapClip>();

		private static var currentBC:BitmapClip;
		
		
		public static function unregisterClip(clip:BitmapClip):void
		{
			
			for (var i:int = 0; i < bitmapClipArray.length; i++) 
			{
				currentBC = bitmapClipArray[i];
				
				if (currentBC == clip)
				{
					clip.removeEventListener(BitmapClipEvent.CLIP_CHANGE, onClipChanged);
					clip.removeEventListener(BitmapClipEvent.CLIP_PAUSED, onClipPaused);
					clip.removeEventListener(BitmapClipEvent.CLIP_UNPAUSED, onClipUnpaused);
					bitmapClipArray.splice(i, 1);
					return;
				}
			}
		}
		
		public static function registerClip(clip:BitmapClip):void
		{
			for (var i:int = 0; i < bitmapClipArray.length; i++) 
			{
				currentBC = bitmapClipArray[i];
				
				if (clip == currentBC)
					return;
			}
			
			bitmapClipArray.push(clip);
			
			clip.addEventListener(BitmapClipEvent.CLIP_CHANGE, onClipChanged);
			clip.addEventListener(BitmapClipEvent.CLIP_PAUSED, onClipPaused);
			clip.addEventListener(BitmapClipEvent.CLIP_UNPAUSED, onClipUnpaused);
		}
		
		private static function removeClipFromActive(clip:BitmapClip):void
		{
			for (var i:int = 0; i < activeClipArray.length; i++) 
			{
				currentBC = activeClipArray[i];
				if (currentBC == clip)
				{
					activeClipArray.splice(i, 1);
					break;
				}
			}
		}
		
		private static function addClipToActive(clip:BitmapClip):void
		{
			if (clip.clip.length < 2)
				return;
			
			// check if the clip is already in the array
			for (var i:int = 0; i < activeClipArray.length; i++) 
			{
				currentBC = activeClipArray[i];
				if (currentBC == clip)
					return;
			}
			
			activeClipArray.push(clip);
		}
		
		
		
		public static function stop():void
		{
			if (t == null)
			{
				t = new Timer(33);
				t.addEventListener(TimerEvent.TIMER, go);
			}
			
			t.stop();
		}
		
		public static function play():void
		{
			if (t == null)
			{
				t = new Timer(33);
				t.addEventListener(TimerEvent.TIMER, go);
			}
			
			t.start();
		}
		
		// EVENT HANDLERS
		protected static function onClipChanged(event:Event):void
		{
			currentBC = event.currentTarget as BitmapClip;
			if (currentBC.clip.length < 2)
				removeClipFromActive(currentBC);
			else
				addClipToActive(currentBC);
		}
		
		protected static function onClipPaused(event:Event):void
		{
			currentBC = event.currentTarget as BitmapClip;
			
			removeClipFromActive(currentBC);
		}
		
		protected static function onClipUnpaused(event:Event):void
		{
			currentBC = event.currentTarget as BitmapClip;
			
			addClipToActive(currentBC);
		}
		
		protected static function go(event:TimerEvent):void
		{
			for (var i:int = 0; i < activeClipArray.length; i++) 
			{
				currentBC = activeClipArray[i];
				currentBC.nextFrame();
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