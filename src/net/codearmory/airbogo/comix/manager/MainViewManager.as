package net.codearmory.airbogo.comix.manager
{
	import net.codearmory.airbogo.comix.Main;

	public class MainViewManager
	{
		//----------------------------------------------------------------------------------------------------
		// Singleton
		//----------------------------------------------------------------------------------------------------
		
		static public function get SELF():MainViewManager
		{
			if ( !_SELF ) {
				_SELF = new MainViewManager( new SingletonForcer() );
			}
			return _SELF;
		}
		static private var _SELF:MainViewManager = null;
		
		public function MainViewManager(forcer:SingletonForcer)
		{
			var isNotValidated:Boolean = (forcer is SingletonForcer) === false;
			if ( isNotValidated ) {
				throw new Error("SingletonForcer is invalidated");
			}
		}
		
		//----------------------------------------------------------------------------------------------------
		// Main View
		//----------------------------------------------------------------------------------------------------
		
		private var _main:Main = null;
		
		public function initMainView(main:Main):void
		{
			_main = main;
		}
		
		public function showComixList():void
		{
			_main.showComixList();
		}
		
		public function showMyLibList():void
		{
			_main.showMyLibList();
		}
		
		public function showHome():void
		{
			_main.showHome();
		}
		
		public function showComixPage( fullPath:String ):void
		{
			_main.showComixPage( fullPath );
		}
	}
}

class SingletonForcer {}