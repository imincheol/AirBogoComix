package net.codearmory.airbogo.comix.manager
{
	import flash.net.SharedObject;
	
	import mx.collections.ArrayCollection;

	public class MyLibManager
	{
		//----------------------------------------------------------------------------------------------------
		// Singleton
		//----------------------------------------------------------------------------------------------------
		
		static public function get SELF():MyLibManager
		{
			if ( !_SELF ) {
				_SELF = new MyLibManager( new SingletonForcer() );
			}
			return _SELF;
		}
		static private var _SELF:MyLibManager = null;
		
		public function MyLibManager(forcer:SingletonForcer)
		{
			var isNotValidated:Boolean = (forcer is SingletonForcer) === false;
			if ( isNotValidated ) {
				throw new Error("SingletonForcer is invalidated");
			}
		}
		
		//----------------------------------------------------------------------------------------------------
		// Book
		//----------------------------------------------------------------------------------------------------
		
		public function loadBooks():ArrayCollection
		{
			var books:ArrayCollection = new ArrayCollection();
			
			var soData:Object = getSoData();
			for ( var eachBookName:String in soData ) 
			{
				var text:String = soData[ eachBookName ];
				
				var jsonObj:Object = JSON.parse( text );
				jsonObj.bookName = eachBookName;
				
				var fullPath:String = jsonObj.path;
				var paths:Array = fullPath.split("/");
				var seriesName:String = paths[ paths.length - 3 ]; 
				jsonObj.seriesName = seriesName;
				
				books.addItem( jsonObj );
			}
			
			return books;
		}
		
		public function saveBook(pagePath:String):void
		{
//			trace( pagePath );

			var fullPath:String = pagePath;
			
			var subPaths:Array = pagePath.split("/");
			
			var pageNameIndex:int = subPaths.length - 1;
			var pageName:String = subPaths[ pageNameIndex ];
//			trace( "pageName : " + pageName);
			
			var bookNameIndex:int = subPaths.length - 2;// 가장 마지막 전이 책이름 디렉토리
			var bookName:String = subPaths[ bookNameIndex ];
//			trace( "bookName : " + bookName);
			
			saveSo( bookName, fullPath );
		}
		
		public function deleteAll():void
		{
			var soData:Object = getSoData();
			for ( var eachBookName:String in soData ) 
			{
				deleteBook( eachBookName );
			}
		}

		public function deleteBook(bookName:String):void
		{
			deleteSo( bookName );
		}
		
		//----------------------------------------------------------------------------------------------------
		// SharedObject
		//----------------------------------------------------------------------------------------------------
		
		private var _mySo:SharedObject = null;
		
		private function getSoData():Object 
		{
			if ( !_mySo ) {
				_mySo = SharedObject.getLocal("com.airbogo.app.airbogocomix");
			}
			return _mySo.data;
		}
		
		private function saveSo(bookName:String, fullPath:String):void
		{
			var now:Date = new Date();
			var nowTime:String = now.getTime() + "";
			
			var obj:Object = {path: fullPath, time: nowTime};
			var text:String = JSON.stringify( obj );
			
			//trace( "save : " + text );
			
			getSoData()[ bookName ] = text;
		}
		private function deleteSo(bookName:String):void
		{
			getSoData()[ bookName ] = null;
			delete getSoData()[ bookName ];
		}
		
		
	}
}

class SingletonForcer{}