 package com.creative.text.translation
{
	
	internal class LanguageString
	{
		public var rawString:String;
		
		private var _numberOfParameters:uint = 0;
		private var parameters:Array = [];
		public var finalString:String;
		
		private var flagRegExp:RegExp = /%*[a-zA-Z]*[_]*[a-zA-Z]*%/g;
		
		
		public function LanguageString(rawStringValue:String):void
		{
			rawString = rawStringValue;
		}
		
		
		public function getAvaliableParameters():Array
		{
			var tempString:String = rawString;
			var stringFlagArray:Array = tempString.match(flagRegExp);
			
			for (var i:int = 0; i < stringFlagArray.length; i++) 
			{
				for (var j:int = stringFlagArray.length - 1; j >= 0; j--) 
				{
					if (j == i)
						continue;
					
					if (stringFlagArray[j] == stringFlagArray[i])
					{
						stringFlagArray.splice(j, 1);
					}
				}
				
			}
			
			return stringFlagArray;
			
		}
		
		public function getAvaliableParametersTotal():uint
		{
			var tempString:String = rawString;
			var stringFlagArray:Array = tempString.match(flagRegExp);
			
			if (stringFlagArray.length <= 0)
				return 0;
			
			
			for (var i:int = 0; i < stringFlagArray.length; i++) 
			{
				tempString = tempString.replace(new RegExp(stringFlagArray[i], "g"), "");
				_numberOfParameters++;
				if (tempString.search(flagRegExp) < 0)
					break;
				
			}
			return numberOfParameters;
		}
		
		public function getFinalString(params):String
		{
			var tempString:String = rawString;
			
			
			if (params.length > 0)
			{
				
				var stringFlagArray:Array = tempString.match(flagRegExp);
				
				for (var i:int = 0; i < params.length; i++) 
					tempString = tempString.replace(new RegExp(stringFlagArray[i], "g"), params[i]);
				
			}
			
			
			return tempString;
			
		}
		
		
		
		
		// SETTERS AND GETTERS
		public function get numberOfParameters():uint
		{
			return _numberOfParameters;
		}

		public function set numberOfParameters(value:uint):void
		{
			_numberOfParameters = value;
		}

		
	}
}