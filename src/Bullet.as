package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeffrey Laarman
	 */
	public class Bullet extends Sprite
	{
		private var moveX:Number = 0;
		private var moveY:Number = 0;
		private var speed:Number = 15;
		public function Bullet(r:Number, tPos:Point) 
		{
			super();
			addChild(new BulletArt());
			
			this.rotation = r;
			var radian:Number = this.rotation * Math.PI / 180;
			moveX = Math.cos(radian);
			moveY = Math.sin(radian);
			
			
			this.x += tPos.x + (66 * moveX);
			this.y += tPos.y + (66 * moveY);
			
		}
		public function update():void
		{
			this.x += moveX * speed;
			this.y += moveY * speed;
		}
	}

}