package com.creative.image.bitmap.events
{
	import flash.events.Event;
	
	public class BitmapClipEvent extends Event
	{
		
		public static const CLIP_CHANGE:String = "clipChange";
		public static const CLIP_PAUSED:String = "clipPaused";
		public static const CLIP_UNPAUSED:String = "clipUnpaused";
		
		public function BitmapClipEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}