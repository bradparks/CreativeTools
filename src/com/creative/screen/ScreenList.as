package com.creative.screen
{
	internal class ScreenList
	{
		private var _screenClassArray:Vector.<Class> = new Vector.<Class>();
		
		public function ScreenList()
		{
		}
		
		public function addScreenClass(screenClass:Class):void
		{
			_screenClassArray.push(screenClass);
		}
		
		public function get screenClassArray():Vector.<Class>
		{
			return _screenClassArray;
		}
	}
}