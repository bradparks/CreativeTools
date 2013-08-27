package com.creative.screen
{
	internal class ScreenList
	{
		private var _screenClassArray:Vector.<Class> = new Vector.<Class>();
		
		public function ScreenList()
		{
		}
		
		public function addScreenClass(...screenClass):void
		{
			for (var i:int = 0; i < screenClass.length; i++)
			_screenClassArray.push(screenClass[i]);
		}
		
		public function get screenClassArray():Vector.<Class>
		{
			return _screenClassArray;
		}
	}
}
