package com.creative.image.bitmap
{
	import com.creative.image.bitmap.events.BitmapClipEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class BitmapClip extends Sprite
	{
		private var _clip:Vector.<BitmapData>;

		private var b:Bitmap;
		public var offset:uint = 0;
		
		private var _paused:Boolean = false;
				
		public function BitmapClip(bitmapDataArray:Vector.<BitmapData> = null)
		{
			
			b = new Bitmap();
			addChild(b);
			
			
			if (bitmapDataArray)
				clip = bitmapDataArray;
			
		}

		internal function changeImage(bitmapData:BitmapData):void
		{
			b.bitmapData = bitmapData;
		}
		
		internal function nextFrame():void
		{
			offset++;
			b.bitmapData = clip[offset % clip.length];
		}
		
		public function registerToPlayer():void
		{
			BitmapClipPlayer.registerClip(this);
		}

		// SETTERS AND GETTERS
		public function get clip():Vector.<BitmapData>
		{
			if (_clip == null)
			{
				throw new Error("The BitmapClip clip is not defined! ");
			}
			
			return _clip;
		}

		public function set clip(value:Vector.<BitmapData>):void
		{
			_clip = value;
			
			changeImage(_clip[0]);
			dispatchEvent(new BitmapClipEvent(BitmapClipEvent.CLIP_CHANGE));
		}
		
		public function get paused():Boolean
		{
			return _paused;
		}
		
		public function set paused(value:Boolean):void
		{
			_paused = value;
			
			if (value)
				dispatchEvent(new BitmapClipEvent(BitmapClipEvent.CLIP_PAUSED));
			else
				dispatchEvent(new BitmapClipEvent(BitmapClipEvent.CLIP_UNPAUSED));
		}

	}
}
