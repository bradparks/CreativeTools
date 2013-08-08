package com.creative.image.bitmap
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class BitmapClip extends Sprite
	{
		private var _clip:Vector.<BitmapData>;

		private var b:Bitmap;
		private var currentCount:uint = 0;
		
		public var paused:Boolean = false;
		
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
			currentCount++;
			b.bitmapData = clip[currentCount % clip.length];
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
		}

	}
}