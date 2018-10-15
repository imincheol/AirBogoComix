package net.codearmory.airbogo.comix
{
	import mx.core.FlexGlobals;

	public class AirbogoComixConfig
	{
		//----------------------------------------------------------------------------------------------------
		// Build
		//----------------------------------------------------------------------------------------------------
		
		static public const VERSION:String = "v18.10.152";
		// 미리 앞 2장 더 불러오기
		// 10장 까지만 기억해두기 
		
//		static public const VERSION:String = "v18.10.151";
		// 이미지 목록도 정렬함 
		
//		static public const VERSION:String = "v18.09.192";
		// 로그인화면에서 버전정보 보기 
		// 크롬 계열에서 브라우저 정보 문제로 index.html 수정
		
//		static public const VERSION:String = "v18.09.191";
		// flashvars 에서 url 과 host 받을 수 있도록 수정
		
//		static public const VERSION:String = "v17.09.221";
		// 처음에 바로 이미지가 클릭 되어 있도록 수정
		
//		static public const VERSION:String = "v17.02.061";
		// 전체화면 모드 
		// 페이징 이동 기능 ( 숫자점프 )
		// 키보드 이동 기능 수정 
		// 내서재 선택삭제/전체삭제
		
//		static public const VERSION:String = "v17.02.030";
		// 탭모드 - 내서재, 에어보고서재 
		// 내서재는 책갈피 모드
		// 자동 재생기능 탑재 
		
//		static public const VERSION:String = "v16.12.042";
		
		//----------------------------------------------------------------------------------------------------
		// Config
		//----------------------------------------------------------------------------------------------------
		
//		static private var _PROTOCOL:String = "http://";
//		static private var _HOST:String = "localhost";
//		static private var _PORT:String = "31267";
		
		static public function get DOMAIN():String
		{
			var paramObj:Object = FlexGlobals.topLevelApplication.parameters;
			var url:String = paramObj["url"];
			return url;
		}
		
		public static const NAME:String = "에어보고코믹스";
	}
}