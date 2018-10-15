package net.codearmory.airbogo.comix.manager
{
	import mx.core.UIComponent;

	public class LoadingViewManager 
	{
		//----------------------------------------------------------------------------------------------------
		// Singleton
		//----------------------------------------------------------------------------------------------------

		static public function get SELF():LoadingViewManager
		{
			if ( !_SELF ) {
				_SELF = new LoadingViewManager( new SingletonForcer() );
			}
			return _SELF;
		}
		static private var _SELF:LoadingViewManager = null;
		
		public function LoadingViewManager(forcer:SingletonForcer)
		{
			var isNotValidated:Boolean = (forcer is SingletonForcer) === false;
			if ( isNotValidated ) {
				throw new Error("SingletonForcer is invalidated");
			}
		}
		
		//----------------------------------------------------------------------------------------------------
		// Loading View
		//----------------------------------------------------------------------------------------------------
		
		private var viewLoading:UIComponent = null;
		private var showFunction:Function = null;
		private var hideFunction:Function = null;
		
		public function initView(view:UIComponent):void
		{
			viewLoading = view;
			
			if ( viewLoading ) {
				hide();
			}
		}
		public function initFunctions(show:Function, hide:Function):void
		{
			showFunction = show;
			hideFunction = hide;
			
			if ( showFunction is Function && hideFunction is Function ) {
				hide();
			}
		}

		public function show():void
		{
			if ( viewLoading ) {
				viewLoading.visible = true;
			}
			else if ( showFunction is Function ) {
				showFunction();
			}
		}
		
		public function hide():void
		{
			if ( viewLoading ) {
				viewLoading.visible = false;
			}
			else if ( hideFunction is Function ) {
				hideFunction();
			}
		}
		
		//----------------------------------------------------------------------------------------------------
		// 
		//----------------------------------------------------------------------------------------------------
		

	}
}

class SingletonForcer {}
