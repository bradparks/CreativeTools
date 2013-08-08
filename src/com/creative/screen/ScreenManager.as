package com.creative.screen
{
	public class ScreenManager
	{
		
		private var screenArray:Array = [];
		private var screenHistory:Vector.<int>;
		
		public function ScreenManager():void
		{
			screenHistory = new Vector.<int>();
			
			
			
		}
		
		public function setScreen(screenID:int):void
		{
			screenArray[screenID].managerRef = this;
		}
		
		public function goBack():void
		{
			
		}
		
	}
}