package com.creative.text.translation
{
	import flash.text.TextField;

	internal class RegisteredTextField
	{
		public var target:TextField;
		public var source:String;
		public var params:Array = [];
		
		public function RegisteredTextField(targetTextField:TextField = null, sourceString:String = "", ...TextFieldParams):void
		{
			
			target = targetTextField;
			source = sourceString;
			params = TextFieldParams;
		}
		
		public function set text(value:String):void
		{
			target.text = value;
		}
	}
}