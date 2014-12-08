package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jeffrey Laarman
	 */
	public class Chest extends Sprite
	{
		private var chestArt:MovieClip;
		public var lives:int = 20;
		public function Chest() 
		{
			chestArt = new ChestArt();
			addChild(chestArt);
			this.scaleX = this.scaleY = 0.3;
		}
		
	}

}