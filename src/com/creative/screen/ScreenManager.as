package com.creative.screen
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObjectContainer;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.ui.Keyboard;
	

	public class ScreenManager
	{
		
		private var screenClassArray:Vector.<Class>;
		private var screenHistory:Vector.<int>;
		
		private var currentScreen:AScreen;
		private var _targetHolder:DisplayObjectContainer;
		
		private var screenListObject:ScreenList;
		
		private var maxScreenWidth:int;
		private var maxScreenHeight:int;
		
		
		public function ScreenManager(holder:DisplayObjectContainer, screenWidth:int, screenHeight:int):void
		{
			maxScreenWidth = screenWidth;
			maxScreenHeight = screenHeight;
			
			_targetHolder = holder;
			screenHistory = new Vector.<int>();
			screenListObject = new ScreenList();
		}
		
		public function addScreenClass(...screenClass):void
		{
			for (var i:int = 0; i < screenClass.length; i++) 
			{
				screenListObject.addScreenClass(screenClass[i]);
			}
			
		}
		
		public function init():void
		{
			screenClassArray = screenListObject.screenClassArray;
			gotoScreen(0);
		}
		
		private function setKeyListeners():void
		{
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.BACK:
				{
					event.preventDefault();
					event.stopImmediatePropagation();
					goBack();
					break;
				}
					
				case Keyboard.MENU:
				{
					event.preventDefault();
					event.stopImmediatePropagation();
					
					gotoScreen(2);
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
		private function cleanup():void
		{
			if (currentScreen == null)
				return;
			
			currentScreen.deactivate();
			_targetHolder.removeChild(currentScreen);
			currentScreen = null;
			
			System.gc();
			System.gc();
		}
		
		internal function goBack():void
		{
			if (screenHistory.length == 1)
			{
				NativeApplication.nativeApplication.exit();
				return;
			}
			
			var targetScreenID:uint = screenHistory[screenHistory.length - 2];
			screenHistory.splice(screenHistory.length - 1, 1);
			gotoScreen(targetScreenID, false);
		}
		
		public function gotoScreen(screenID:int, writeHistory:Boolean = true):void
		{
			cleanup();
			
			var screenClass:Class = screenClassArray[screenID];
			
			currentScreen = new screenClass();
			currentScreen.screenWidth = maxScreenWidth;
			currentScreen.screenHeight = maxScreenHeight;
			currentScreen.managerRef = this;
			
			targetHolder.addChild(currentScreen);
			
			currentScreen.init();
			currentScreen.resize();
			
			if (writeHistory)
				screenHistory.push(screenID);
		}
		
		// SETTERS AND GETTERS
		public function get targetHolder():DisplayObjectContainer
		{
			return _targetHolder;
		}

		
	}
}