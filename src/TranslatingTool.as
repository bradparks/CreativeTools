package
{
	
	import com.creative.image.bitmap.BitmapClip;
	import com.creative.image.bitmap.BitmapClipPlayer;
	import com.creative.image.bitmap.DisplayObjectProcessing;
	import com.creative.text.translation.LanguageStrings;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	[SWF(width="1000", height="600", backgroundColor="#ffffff")]
	
	public class TranslatingTool extends Sprite
	{

		public function TranslatingTool()
		{
			setStage();
			
			//test();
			bitmapTest();
		}
		
		private function bitmapTest():void
		{
			BitmapClipPlayer.init();
			
			for (var i:int = 0; i < 60; i++) 
			{
				var v:VikingAttack = new VikingAttack();
				var a:Vector.<BitmapData> = DisplayObjectProcessing.getMovieClipFrames(v);
				
				var bc:BitmapClip = new BitmapClip(a);
				
				bc.x = bc.width * i;
				
				BitmapClipPlayer.registerClip(bc);
				
				addChild(bc);
				
			}
			BitmapClipPlayer.play();
		}
		
		private function test():void
		{
			var ul:URLLoader = new URLLoader();
			ul.addEventListener(Event.COMPLETE, onDone);
			ul.load(new URLRequest("data/translations.xml"));
			
			function onDone(e:Event):void
			{
				var xml:XML = new XML(e.currentTarget.data);
				
				LanguageStrings.registerLanguageXML(xml);
				
				te();
			}
		}
		
		private function te():void
		{
			
			var tf:TextField = new TextField();
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.text = LanguageStrings.getString("TEST_STRING", "2342", "12", "999");
			addChild(tf);
			
			LanguageStrings.registerTextField(tf, "TEST_STRING", "2342", "12", "999");
			
			stage.addEventListener(MouseEvent.CLICK, tfClick);
			
		}
		
		protected function tfClick(event:MouseEvent):void
		{
			LanguageStrings.setLanguage("EN");
		}			
		
		
		private function setStage():void
		{
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
	}
}