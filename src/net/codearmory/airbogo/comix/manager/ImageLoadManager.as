package net.codearmory.airbogo.comix.manager
{
	import flash.events.Event;
	
	import spark.components.Group;
	import spark.components.Image;

	public class ImageLoadManager
	{
		static public function getImage(callback:Function, viewBackScreen:Group):Image
		{
			const image:Image = new Image();
			viewBackScreen.addElement(image);
			image.addEventListener(Event.COMPLETE, function completeHandler(event:Event):void {
				callback(image);
				viewBackScreen.removeElement(image);
			});
			return image;
		}
		
		public function ImageLoadManager()
		{
		}
	}
}