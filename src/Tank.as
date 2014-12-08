package  
{
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Jeffrey Laarman
	 */
	public class Tank extends TankBase
	{
		//private var tankBodyArt:MovieClip;
		//private var tankTurretArt:TankTurretArt;
		
		private var controlDir:Point;
		private var speed:Number = 0;
		
		//public var turretAngle:Number = 0;
		
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			/*
			tankBodyArt = new TankBodyArt(); //instantieren van de class
			this.addChild(tankBodyArt); //class op het scherm zetten binnen Tank.as
			
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);
			*/
			controlDir = new Point(0, 0);
			
			//this.scaleX = this.scaleY = 0.5;

		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			//this.addEventListener(Event.ENTER_FRAME, loop);//verplaatsen naar tankbase
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			var se:ShootEvent = new ShootEvent("onShoot");
			se.shooter = this;
			dispatchEvent(se);
		}
		
		override public function loop(e:Event):void 
		{
			//this.x += controlDir.x * 5;dw
			//this.y += controlDir.y * 5;
			
			speed = controlDir.y * -7;
			
			this.rotation += controlDir.x * 4;  
			var radian:Number = this.rotation * Math.PI / 180;
							//Van graden naar radians
			var xMove:Number = Math.cos(radian);
			var yMove:Number = Math.sin(radian);
			this.x += xMove * speed;
			this.y += yMove * speed;
			
			
			targetPosition.x = mouseX;
			targetPosition.y = mouseY;
			
			super.loop(e);
			
			/*
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			
			radian = Math.atan2(dy, dx);
			var angle:Number = radian * 180 / Math.PI; // Omzetten van radian naar angle
			
			tankTurretArt.rotation = angle;
			turretAngle = tankTurretArt.rotation;
							
			
							// -180 tot 180
							// Radian de rotatie moet omgezet gaan worden naar radians.
			*/
			
			
			/*
			if (WPressed)
			{
				this.y -= 5;
			}
			if (APressed)
			{
				this.x -= 5;
			}
			if (SPressed)
			{
				this.y += 5
			}	
			if (DPressed)
			{
				this.x += 5;
			}
			*/
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler heeft toets W lostgelaten
			
				controlDir.y = -1;
			}
			if (e.keyCode == Keyboard.A)
			{
				//speler heeft toets W lostgelaten

				controlDir.x = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				//speler heeft toets W lostgelaten

				controlDir.y = 1;
			}
			if (e.keyCode == Keyboard.D)
			{
				//speler heeft toets W lostgelaten

				controlDir.x = 1;
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W) 
			{
				//speler drukt op W

				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.A) 
			{
				//speler drukt op W

				controlDir.x = 0;
			}
			if (e.keyCode == Keyboard.S) 
			{
				//speler drukt op W

				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.D) 
			{
				//speler drukt op W

				controlDir.x = 0;
			}
		}
		override public function destroy():void 
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			super.destroy();
		}
		
	}

}