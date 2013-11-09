package com.creative.image.bitmap
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	public class DisplayObjectProcessing
	{
		
		/**
		 * This method will return you the Bitmap of the provided DisplayObject.
		 * Using Bitmap instead of Vecor graphics is faster, but it takes time to draw the Bitmap, so avoid creating Bitmaps on runtime, instead pre-render.
		 * 
		 * @param value - Your provided DisplayObject or any class extending DisplayObject.
		 * @param resetPosition - this will move the DisplayObject to 0,0 position to avoid cutting off parts of the DisplayObject
		 * @param bgFillColor - fill color for non-transparent DisplayObjects.
		 * @param transparent - Specifies whether the bitmap image supports per-pixel transparency. The default value is true (transparent). To create a fully transparent bitmap, set the value of the transparent parameter to true and the value of the fillColor parameter to 0x00000000 (or to 0). Setting the transparent property to false can result in minor improvements in rendering performance.
		 * @param smooth - A Boolean value that determines whether a BitmapData object is smoothed when scaled or rotated, due to a scaling or rotation in the matrix parameter. The smoothing parameter only applies if the source parameter is a BitmapData object. With smoothing set to false, the rotated or scaled BitmapData image can appear pixelated or jagged.
		 */
		public static function getBitmap(value:DisplayObject, resetPosition:Boolean = false, bgFillColor:uint = 0x00000000, transparent:Boolean = true, smooth:Boolean = true):Bitmap
		{
			if (value is MovieClip)
			{
				(value as MovieClip).gotoAndStop(1);
			}
			
			var m:Matrix = value.transform.matrix;
			
			if (resetPosition == true)
			{
				var rect:Rectangle = new Rectangle();
				rect = value.getBounds(value);
				
				
				m.translate(-rect.x * value.scaleX, -rect.y * value.scaleY);
			}
			
			var bd:BitmapData = new BitmapData(value.width + 1, value.height + 1, transparent, bgFillColor);
			bd.draw(value, m, null, null, null, smooth);
			var b:Bitmap = new Bitmap(bd, "auto", smooth);
			
			
			return b;
		}
		
		/**
		 * This method will return you the Bitmap of the specified MovieClip's frame.
		 * Using Bitmap instead of Vecor graphics is faster, but it takes time to draw the Bitmap, so avoid creating Bitmaps on runtime, instead pre-render.
		 * 
		 * @param value - Your provided DisplayObject or any class extending DisplayObject. If the DisplayObject is not MovieClip, it will work same as getBitmap() function.
		 * @param frame - The frame that will be returned as Bitmap. If the frame is 0 or greater then total number of frames the first frame will be returned.
		 * @param resetPosition - this will move the DisplayObject to 0,0 position to avoid cutting off parts of the DisplayObject
		 * @param bgFillColor - fill color for non-transparent DisplayObjects.
		 * @param transparent - Specifies whether the bitmap image supports per-pixel transparency. The default value is true (transparent). To create a fully transparent bitmap, set the value of the transparent parameter to true and the value of the fillColor parameter to 0x00000000 (or to 0). Setting the transparent property to false can result in minor improvements in rendering performance.
		 * @param smooth - A Boolean value that determines whether a BitmapData object is smoothed when scaled or rotated, due to a scaling or rotation in the matrix parameter. The smoothing parameter only applies if the source parameter is a BitmapData object. With smoothing set to false, the rotated or scaled BitmapData image can appear pixelated or jagged.
		 */
		public static function getBitmapFrame(value:DisplayObject, frame:uint = 1, resetPosition:Boolean = false, bgFillColor:uint = 0x00000000, transparent:Boolean = true, smooth:Boolean = true):Bitmap
		{
			
			if (value is MovieClip)
			{
				if (frame == 0 || frame > (value as MovieClip).totalFrames)
					frame = 1;
				
				(value as MovieClip).gotoAndStop(frame);
			}
			var m:Matrix = value.transform.matrix;
			
			if (resetPosition == true)
			{
				var rect:Rectangle = new Rectangle();
				rect = value.getBounds(value);
				
				m.translate(-rect.x * value.scaleX, -rect.y * value.scaleY);
			}
			
			var bd:BitmapData = new BitmapData(value.width + 1, value.height + 1, transparent, bgFillColor);
			bd.draw(value, m, null, null, null, smooth);
			var b:Bitmap = new Bitmap(bd, "auto", smooth);
			
			
			return b;
		}
		
		/**
		 * This method will return you the BitmapData of the provided DisplayObject.
		 * Using Bitmap instead of Vecor graphics is faster, but it takes time to draw the Bitmap, so avoid creating Bitmaps on runtime, instead pre-render.
		 * 
		 * @param value - Your provided DisplayObject or any class extending DisplayObject.
		 * @param resetPosition - this will move the DisplayObject to 0,0 position to avoid cutting off parts of the DisplayObject
		 * @param bgFillColor - fill color for non-transparent DisplayObjects.
		 * @param transparent - Specifies whether the bitmap image supports per-pixel transparency. The default value is true (transparent). To create a fully transparent bitmap, set the value of the transparent parameter to true and the value of the fillColor parameter to 0x00000000 (or to 0). Setting the transparent property to false can result in minor improvements in rendering performance.
		 * @param smooth - A Boolean value that determines whether a BitmapData object is smoothed when scaled or rotated, due to a scaling or rotation in the matrix parameter. The smoothing parameter only applies if the source parameter is a BitmapData object. With smoothing set to false, the rotated or scaled BitmapData image can appear pixelated or jagged.
		 */
		public static function getBitmapData(value:DisplayObject, resetPosition:Boolean = false, bgFillColor:uint = 0x00000000, transparent:Boolean = true, smooth:Boolean = true, cutEdge:Boolean = false):BitmapData
		{
			if (value is MovieClip)
			{
				(value as MovieClip).gotoAndStop(1);
			}
			
			var m:Matrix = value.transform.matrix;
			
			if (resetPosition == true)
			{
				var rect:Rectangle = new Rectangle();
				rect = value.getBounds(value);
				
				
				m.translate(-rect.x * value.scaleX, -rect.y * value.scaleY);
			}
			
			var bd:BitmapData = new BitmapData(value.width + 1, value.height + 1, transparent, bgFillColor);
			bd.draw(value, m, null, null, null, smooth);
			
			return bd;
		}
		
		/**
		 * This method will return you the BitmapData of the specified MovieClip's frame.
		 * Using Bitmap instead of Vecor graphics is faster, but it takes time to draw the Bitmap, so avoid creating Bitmaps on runtime, instead pre-render.
		 * 
		 * @param value - Your provided DisplayObject or any class extending DisplayObject. If the DisplayObject is not MovieClip, it will work same as getBitmapData() function.
		 * @param frame - The frame that will be returned as BitmapData. If the frame is 0 or greater then total number of frames the first frame will be returned.
		 * @param resetPosition - this will move the DisplayObject to 0,0 position to avoid cutting off parts of the DisplayObject
		 * @param bgFillColor - fill color for non-transparent DisplayObjects.
		 * @param transparent - Specifies whether the bitmap image supports per-pixel transparency. The default value is true (transparent). To create a fully transparent bitmap, set the value of the transparent parameter to true and the value of the fillColor parameter to 0x00000000 (or to 0). Setting the transparent property to false can result in minor improvements in rendering performance.
		 * @param smooth - A Boolean value that determines whether a BitmapData object is smoothed when scaled or rotated, due to a scaling or rotation in the matrix parameter. The smoothing parameter only applies if the source parameter is a BitmapData object. With smoothing set to false, the rotated or scaled BitmapData image can appear pixelated or jagged.
		 */
		public static function getBitmapDataFrame(value:DisplayObject, frame:uint = 1, resetPosition:Boolean = false, bgFillColor:uint = 0x00000000, transparent:Boolean = true, smooth:Boolean = true):BitmapData
		{
			
			if (value is MovieClip)
			{
				if (frame == 0 || frame > (value as MovieClip).totalFrames)
					frame = 1;
				
				(value as MovieClip).gotoAndStop(frame);
			}
			var m:Matrix = value.transform.matrix;
			
			if (resetPosition == true)
			{
				var rect:Rectangle = new Rectangle();
				rect = value.getBounds(value);
				
				m = new Matrix();
				m.translate(-rect.x * value.scaleX, -rect.y * value.scaleY);
			}
			
			var bd:BitmapData = new BitmapData(value.width + 1, value.height + 1, transparent, bgFillColor);
			bd.draw(value, m, null, null, null, smooth);
			
			return bd;
		}
		
		/**
		 * This method draws every frame of a provided MovieClip and returns a vector-array of BitmapData.
		 * 
		 * @param movieClip - target MovieClip
		 * @param resetPosition - A int value that determines by witch frame all the movieClips are supposed to be positioned.
		 * -1 will result no repositioning - default value
		 * 0 will result positioning by the greatest offset frame. For example if frame1 offset is (-10, 5), frame2 (-2, -5), the offset will be counted from (-10, -5).
		 * any other int value will result positioning by that frame.
		 * @param transparent - Specifies whether the bitmap image supports per-pixel transparency. The default value is true (transparent). To create a fully transparent bitmap, set the value of the transparent parameter to true and the value of the fillColor parameter to 0x00000000 (or to 0). Setting the transparent property to false can result in minor improvements in rendering performance.
		 * @param bgFillColor:uint - fill color for non-transparent DisplayObjects.
		 */
		public static function getMovieClipFrames(movieClip:MovieClip, resetPosition:int = -1, smooth:Boolean = true, transparent:Boolean = true, bgFillColor:uint = 0x000000):Vector.<BitmapData>
		{
			var bdArray:Vector.<BitmapData> = new Vector.<BitmapData>();
			
			var rect:Rectangle = movieClip.getBounds(movieClip);
			var m:Matrix = movieClip.transform.matrix;

			var mcWidth:int = rect.width + rect.x * movieClip.scaleX;
			var mcHeight:int = rect.height + rect.y * movieClip.scaleY;
			
			if (resetPosition > -1)
			{
				if (resetPosition > 0)
				{
					movieClip.gotoAndStop(resetPosition);
					rect = movieClip.getBounds(movieClip);
					m.translate(-rect.x * movieClip.scaleX, -rect.y * movieClip.scaleY);
					
					mcWidth += -rect.x;
					mcHeight += -rect.y;
				}
				else
				{
					var maxX:Number = 0;
					var maxY:Number = 0;
					
					for (var j:int = 0; j < movieClip.totalFrames; j++) 
					{
						movieClip.gotoAndStop(j);
						rect = movieClip.getBounds(movieClip);
						
						if (rect.x < maxX)
							maxX = rect.x;
						
						if (rect.y < maxY) 
							maxY = rect.y;
						
						if (mcWidth < rect.width + rect.x)
							mcWidth = rect.width + rect.x + 1;
						
						if (mcHeight < rect.height + rect.y)
							mcHeight = rect.height + rect.y + 1;
						
					}
					
					
					mcWidth += -maxX;
					mcHeight += -maxY;
					
					m.tx = -maxX * movieClip.scaleX;
					m.ty = -maxY * movieClip.scaleY;
				}
				
			}
			
			movieClip.gotoAndStop(1);
			
			for (var i:int = 0; i < movieClip.totalFrames; i++) 
			{
				movieClip.gotoAndStop(i);
				
				var frameWidth:Number = mcWidth * movieClip.scaleX;
				var frameHeight:Number = mcHeight * movieClip.scaleY;
				
				var bd:BitmapData = new BitmapData(frameWidth, frameHeight, transparent, bgFillColor);
				bd.draw(movieClip, m, null, null, null, true);
				
				bdArray.push(bd);
			}
			
			return bdArray;
		}
		
		
	}
}