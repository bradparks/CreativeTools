package com.creative.text.translation
{
	import flash.text.TextField;
	
	public dynamic class LanguageStrings
	{
		
		private static var languages:Vector.<String> = new Vector.<String>();
		private static var stringArray:Vector.<LanguageString> = new Vector.<LanguageString>();
		private static var stringNameArray:Vector.<String> = new Vector.<String>();
		private static var _currentLaguage:String;
		
		private static var registeredTextFieldArray:Vector.<RegisteredTextField> = new Vector.<RegisteredTextField>();

		
		public static function registerLanguageXML(xml:XML):void
		{
			for (var i:int = 0; i < xml[0][0].tl.length(); i++) 
				languages.push(xml[0][0].tl[i].@i);
			
			for (var j:int = 0; j < xml[0][0].t.length(); j++) 
			{
				var ls:LanguageString = new LanguageString(xml[0][0].t[j]);
				LanguageStrings[xml[0][0].t[j].@i] = ls;
				stringArray.push(ls);
				
				stringNameArray.push(xml[0][0].t[j].@i);
			}
			
			// removing reaccuring string names 
			for (var i2:int = 0; i2 < stringNameArray.length; i2++) 
				stringNameArray[i2] = stringNameArray[i2].substr(3);
				
			
			for (var kk:int = 0; kk < stringNameArray.length; kk++) 
			{
				for (var k:int = stringNameArray.length - 1; k >= 0; k--) 
				{
					if (k == kk)
						continue;
					if (stringNameArray[k] == stringNameArray[kk])
						stringNameArray.splice(k, 1);
				}
			}
			
			
			setLanguage(languages[0]);
		}
		
		public static function setLanguage(language:String):void
		{
			currentLaguage = language;
		}
		
		
		public static function getString(name:String, ...params):String
		{
			var parameters:Array = [];
			
			for (var i:int = 0; i < params.length; i++) 
			{
				if (params[i] is Array)
					for (var j:int = 0; j < params[i][0].length; j++) 
						parameters.push(params[i][0][j]);
				else
					parameters.push(params[i]);
				
			}
			
			var ls:LanguageString = LanguageStrings[currentLaguage + "_" + name];
			
			return ls.getFinalString(parameters);
		}
		
		public static function getLanguageString(name:String, language:String, ...params):String
		{
			var ls:LanguageString = LanguageStrings[language + "_" + name];
			
			return ls.getFinalString(params);
		}
		
		public static function getStringParamsLength(name:String):uint
		{
			var ls:LanguageString = LanguageStrings[currentLaguage + "_" + name];
			return ls.getAvaliableParametersTotal();
		}
		
		public static function getLanguageStringParamsLength(name:String, language:String):uint
		{
			var ls:LanguageString = LanguageStrings[language + "_" + name];
			return ls.getAvaliableParametersTotal();
		}
		
		public static function getStringParameterArray(name:String):Array
		{
			var ls:LanguageString = LanguageStrings[currentLaguage + "_" + name];
			return ls.getAvaliableParameters();
		}
		
		public static function getLanguageStringParameterArray(name:String, language:String):Array
		{
			var ls:LanguageString = LanguageStrings[language + "_" + name];
			return ls.getAvaliableParameters();
		}
		
		/**
		 * This method returns a list of all the strings avaliable for all the registered languages without the language prefix
		 */
		public static function getAllStringsAvaliable():Vector.<String>
		{
			return stringNameArray;
		}
		
		/**
		 * This method returns all the languages registered in this class
		 */
		public static function getAllLanguagesAvaliable():Vector.<String>
		{
			return languages;
		}
		
		
		public static function registerTextField(targetTextField:TextField, stringName:String, ...params):void
		{
			var regTextField:RegisteredTextField = new RegisteredTextField(targetTextField, stringName, params);
			
			registeredTextFieldArray.push(regTextField);
		}
		
		public static function unregisterTextField(targetTextField:TextField):void
		{
			for (var i:int = 0; i < registeredTextFieldArray.length; i++) 
			{
				if (registeredTextFieldArray[i].target == targetTextField)
				{
					registeredTextFieldArray[i] = null;
					registeredTextFieldArray.splice(i, 1);
					break;
				}
			}
			
		}
		
		public static function unregisterAllTextFields():void
		{
			for (var i:int = 0; i < registeredTextFieldArray.length; i++) 
			{
				registeredTextFieldArray[i] = null;
			}
			
			registeredTextFieldArray = new Vector.<RegisteredTextField>();
		}
		
		
		// SETTERS AND GETTERS
		public static function get currentLaguage():String
		{
			return _currentLaguage;
		}

		public static function set currentLaguage(value:String):void
		{
			_currentLaguage = value;
			
			if (registeredTextFieldArray.length > 0)
			{
				for (var i:int = 0; i < registeredTextFieldArray.length; i++) 
				{
					if (registeredTextFieldArray[i] == null)
						continue;
					registeredTextFieldArray[i].text = LanguageStrings.getString(registeredTextFieldArray[i].source, registeredTextFieldArray[i].params);
				}
				
			}
			
			
		}

	}
}