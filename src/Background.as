package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Jeffrey Laarman
	 */
	public class Background extends Sprite
	{
		[Embed(source = "../lib/background2.jpg")]
		private var BGImage:Class;
		private var imageInstance:Bitmap;
		
		public function Background():void
		{
			//constructor
			imageInstance = new BGImage();
			addChild(imageInstance);
			
		}
		
	}

}